$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'
require 'qwik/site-plan'

module Qwik
  class Action
    D_plugin_plan = {
      :dt => 'Show plan plugin',
      :dd => 'You can show the plan of this group.',
      :dc => "* Example
 {{plan}}
{{plan}}
You can see plans of this group.
If there are no plan for this group, you see nothing.
* How to input your plan.
You can specify your new plan from the tag to the title line of each page.
For example,
 * [2005-08-10] 2nd meeting
input this line to the first line of the page.
(Fix the date to recent days.)
Then, you'll see the plan on the sidemenu.
"
    }

    Dja_plugin_plan = {
      :dt => '�\��\���v���O�C��',
      :dd => '�\���\�����܂��B',
      :dc => "* ��
 {{plan}}
{{plan}}
�����\�肪�o�^����Ă���ꍇ�́A���̃v���O�C���ŕ\������܂��B
* �\��̓o�^���@
���L�̂悤�ɁA�y�[�W�̈�s�ڂɃ^�O�L�@�ŋL�q���܂��B
 * [2005-08-10] �~�[�e�B���O�����
�T�C�h���j���[�ɗ\�肪�\�������悤�ɂȂ�܂��B
�ߋ��̗\��͕\������܂���B�܂���N�ȏ��̗\����\������܂���B
�ꃖ������x�̗\���o�^���Ă݂Ă��������B
"
    }

    def plg_plan
      div = [:div, {:class=>'plan'}, [:h2, _('Plan')]]
      pages = @site.get_pages_with_date
      #qp pages
      return if pages.empty?
      if ! pages.empty?
	ul = plan_make_html(pages)
	#qp ul
	div << ul
      end
      div << [:p, [:a, {:href=>'.plan'}, _('Create a new plan')]]
      return div
    end

    def plan_make_html(pages)
      day = 60 * 60 * 24
      nowi = @req.start_time.to_i
      pages = pages.select {|pagekey, datei|
	page = @site[pagekey]
	diff = datei - nowi
	-day < diff
      }
      return nil if pages.empty?

      ul = [:ul]
      pages.sort_by {|pagekey, datei|
	datei
      }.each {|pagekey, datei|
	page = @site[pagekey]
	title = page.get_title
	date = Time.at(datei)
	now = Time.at(nowi)
	date_abbr = Action.date_abbr(now, date)
	em_title = Action.date_emphasis(now, date, title)
	ul << [:li, "#{date_abbr} ", [:a, {:href=>"#{pagekey}.html"}, em_title]]
      }
      return ul
    end

    # Make a new plan.
    def act_plan
      date = @req.query['date']
      title = @req.query['title']
      if date.nil? || date.empty? || title.nil? || title.empty?
	date_attr = {:name=>'date', :class => 'focus'}
	date_attr[:value] = date if date && ! date.empty?
	title_attr = {:name=>'title'}
	title_attr[:value] = title if title && ! title.empty?
	form = [:form, {:action=>'.plan', :method=>'POST'},
	  [:dl,
	    [:dt, _('Date')],
	    [:dd, [:input, date_attr]],
	    [:dt, _('Title')],
	    [:dd, [:input, title_attr]]],
	  [:input, {:type=>'submit', :value=>_('Create a new plan')}]]
	return c_notice(_('New plan')) {
	  [[:h2, _('New plan')],
	    [:div, {:class=>'plan form'},
	      form]]
	}
      end

      # Create a new plan
      page = @site.create_new	# CREATE
      page.store("* [#{date}] #{title}\n")	# Specify date tag.

      url = "#{page.key}.edit"
      return c_notice(_('New plan'), url, 201) {	# 201, Created
	[[:h2, _('Created.')],
	  [:p, [:a, {:href=>url}, _('Edit new page')]]]
      }
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActPlan < Test::Unit::TestCase
    include TestSession

    def test_plg_plan
      ok_wi([], '{{plan}}')

      page = @site.create_new
      page.store('* [1970-01-01] t')
      page = @site.create_new
      page.store('* [1970-01-15] t')
      page = @site.create_new
      page.store('* [1970-02-01] t')
      page = @site.create_new
      page.store('* [1971-01-01] t')

      ok_wi([:div, {:class=>'plan'},
	      [:h2, 'Plan'],
	      [:ul,
		[:li, '01-01 ', [:a, {:href=>'2.html'}, [:strong, 't']]],
		[:li, '01-15 ', [:a, {:href=>'3.html'}, [:em, 't']]],
		[:li, '02-01 ',
		  [:a, {:href=>'4.html'}, [:span, {:class=>'future'}, 't']]],
		[:li, '1971-01-01 ',
		  [:a, {:href=>'5.html'}, [:span, {:class=>'future'}, 't']]]],
	      [:p, [:a, {:href=>".plan"}, "Create a new plan"]]],
	    '{{plan}}')

      # $KCODE = 'n'
      ok_eq("\227\\\222\350", '�\��')
    end
  end
end
