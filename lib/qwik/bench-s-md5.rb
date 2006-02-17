$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'
require 'qwik/test-common'
require 'qwik/act-md5'

class BenchMD5Session < Test::Unit::TestCase
  include TestSession

  def test_all
    repeat = 10
    repeat = 100
    repeat = 1000
    repeat = 10000
    repeat = 1

    t_add_user

    repeat.times {
      res = session('/test/TextFormat.md5')
      #body = res.body.format_xml
      #ok_title("�����ꗗ�ڍה�")
      ok_eq('2ee66272e916d3c21c151920c94334aa', res.body)
    }
  end
end
