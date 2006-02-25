begin
  require 'MeCab'
  $have_mecab = true
rescue LoadError
  $have_mecab = false
end

$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'

module Qwik
  class Action
    Dja_plugin_keywords = {
      :dt => '�L�[���[�h�\���v���O�C��',
      :dd => '�L�[���[�h���X�g���\������܂��B',
      :dc => "* ��
 {{keywords}}
{{keywords}}
"
    }

    def plg_keywords(pagename=@req.base)
      return "no mecab" if ! $have_mecab

      page = @site[pagename]
      return if page.nil?

      content = page.get

      nodes = Action.nodes_get(content)

      hash = Hash.new { 0 }
      nodes.each {|surface, feature|
	hash[surface] += 1
      }
      w = hash.keys.sort.map {|surface|
	num = Math.sqrt(hash[surface]) * 12
	fontsize = "%.2fpx" % num
	href = "#{surface.escape}.search"
	[:a, {:style=>"font-size:#{fontsize};",
	    :href=>href}, surface]
      }
      return [:div, {:class=>'keywords'}, *w]
    end

    PATTERN_SJIS = '[\x81-\x9f\xe0-\xef][\x40-\x7e\x80-\xfc]'
    PATTERN_EUC = '[\xa1-\xfe][\xa1-\xfe]'
    RE_SJIS = Regexp.new(PATTERN_SJIS, 0, 'n')
    RE_EUC = Regexp.new(PATTERN_EUC, 0, 'n')

    HIRAGANA = "[��-��[�`]"
    KANJI = "[��-�]"

    def self.nodes_get(content)
      content.set_sjis
      euc_content = content.to_euc
      tagger = MeCab::Tagger.new([$0])
      n = tagger.parseToNode(euc_content)
      nodes = []
      while n.hasNode != 0
	surface = n.getSurface.set_euc.to_sjis
	feature = n.getFeature.set_euc.to_sjis
	if ! surface.empty? &&
	    RE_SJIS =~ surface &&
	    /\A([��-��[�`]+)\z/s !~ surface &&
	    /\A[�D-���A�B]/s !~ surface &&
	    /\A[�C��]/s !~ surface
#	    /\A[�@�O-�X���u�v�i�j�A�B]/s !~ surface
	  nodes << [surface, feature]
	end
	n = n.next
      end
      return nodes
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
      $KCODE = 's'
end

if defined?($test) && $test
  class TestAction < Test::Unit::TestCase
    include TestSession

    def test_keywords
      c = Qwik::Action
#      eq ["��"], c.nodes_get("��")
#      eq ["����", "��", "�e�X�g", "�ł�", "�B"],
#	c.nodes_get("����̓e�X�g�ł��B")
#      eq ["����", "��", "��", "�Ȃ�", "��", "��"],
#	c.nodes_get("���������Ȃ��Ƃ�")
#      eq ["���Y", "��", "����", "�{", "��", "��Y", "��", "��", "��",
#	"����", "��", "�n��", "��", "�B"],
#	c.nodes_get("���Y�͂��̖{���Y�����������ɓn�����B")
    end

    def test_plg_keywords
      page = @site.create('2')
      page.store("��")

      ok_wi [:div, {:class=>"keywords"},
	[:a, {:style=>"font-size:12.00px;", :href=>"%8E%9A.search"}, "��"]],
	"{{keywords(2)}}"
    end
  end
end
