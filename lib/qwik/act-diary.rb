# Copyright (C) 2003-2006 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL 2.

$LOAD_PATH.unshift '..' unless $LOAD_PATH.include? '..'
require 'qwik/act-include'

module Qwik
  class Action
    def plg_diary
      keys = []
      @site.each {|page|
	if /\A#{@req.base}_(.+)\z/ =~ page.key
	  keys << page.key
	end
      }

      div = []
      keys.sort.reverse.each {|key|
	div << plg_include(key)
      }
      return div
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActDiary < Test::Unit::TestCase
    include TestSession

    def test_plg_diary
      t_add_user

      page = @site.create('Diary')
      page.store("{{diary}}")
      page1 = @site.create('Diary_20070417')
      page1.store("d1")
      page2 = @site.create('Diary_20070418')
      page2.store("d2")

      res = session('/test/Diary.html')
      ok_in([[[:div,
   {:class=>"day"},
   "",
   [:div,
    {:class=>"body"},
    [:div, {:class=>"section"}, [[:p, "d2"]]],
    [:"!--", "section"]],
   [:"!--", "body"]],
  [:"!--", "day"]],
 [[:div,
   {:class=>"day"},
   "",
   [:div,
    {:class=>"body"},
    [:div, {:class=>"section"}, [[:p, "d1"]]],
    [:"!--", "section"]],
   [:"!--", "body"]],
  [:"!--", "day"]]], "//div[@class='section']")
    end
  end
end
