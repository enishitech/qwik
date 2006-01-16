#
# Copyright (C) 2003-2005 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

# This is a sample plugin for qwikWeb.
# If you'd like to check the details of qwikWeb plugin, please see URL below.
# http://qwik.jp/HowToMakePlugin.html

$LOAD_PATH << '../../lib' unless $LOAD_PATH.include?('../../lib')

module Qwik
  class Action
    D_sample = {
      :dt => 'Sample plugins',
      :dd => 'These are sample plugins.',
      :dc => "* Example
You can show famous \"hello, world!\" string by this plugin.

As you know, these \"hello world\" plugins are examples to describe
how you can create your own plugin.

Please check this URL for detail.
http://qwik.jp/HowToMakePlugin.html

** hello world plugin
 {{hello}}
{{hello}}
 {{hello(\"qwik users\")}}
{{hello(\"qwik users\")}}
You can specify the target in the argument.
** hello world action
 [[.hello]]
[[.hello]]
You can see a page with 'hello world' message.
** Monospace plugin
{{tt(\"This is a test.\")}}
 {{tt(\"This is a test.\")}}
You can make the string as monotype font face.

** Quote plugin
{{quote
This is a text to quote.
}}
 {{quote
 This is a text to quote.
 }}
You can make block quote of the string.
" }

    def plg_hello(target='world')
      return [:strong, "hello, #{target}!"]
    end

    def act_hello
      c_notice('hello, world!') {
	'hi, there.'
      }
    end

    def plg_tt(text)
      return [:tt, text]
    end

    def plg_quote
      text = ''
      text = yield if block_given?
      ar = []
      text.each {|line|
	ar << line
	ar << [:br]
      }
      bq = [:blockquote, [:p, {:style=>'font-size:smaller;'}, *ar]]
      return bq
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActSample < Test::Unit::TestCase
    include TestSession

    def test_plg_hello
      ok_wi([:strong, 'hello, world!'], '{{hello}}')
      ok_wi([:strong, 'hello, qwik!'], '{{hello(qwik)}}')
    end

    def test_act_hello
      t_add_user
      res = session('/test/.hello')
      ok_xp([:title, 'hello, world!'], '//title')
      ok_in(['hi, there.'], '//div[@class="section"]')
    end

    def test_plg_tt
      ok_wi([:tt, 't'], '{{tt(t)}}')
    end

    def test_plg_quote
      ok_wi([:blockquote, [:p, {:style=>'font-size:smaller;'}]],
	    '{{quote}}')
      ok_wi([:blockquote, [:p, {:style=>'font-size:smaller;'}]],
	    "{{quote\n\n}}")
      ok_wi([:blockquote, [:p, {:style=>'font-size:smaller;'}, "t\n", [:br]]],
	    "{{quote\nt\n}}")
      ok_wi([:blockquote, [:p, {:style=>'font-size:smaller;'}, "t\n", [:br]]],
	    "{{quote\n\nt\n}}")
      ok_wi([:blockquote, [:p, {:style=>'font-size:smaller;'},
		"t1\n", [:br],
		"t2\n", [:br]]],
	    "{{quote\nt1\nt2\n}}")
    end
  end
end
