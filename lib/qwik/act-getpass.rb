#
# Copyright (C) 2003-2005 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '../../lib' unless $LOAD_PATH.include?('../../lib')
require 'qwik/mail'
require 'qwik/util-sendmail'

module Qwik
  class Action
    # Send password by e-mail.
    def pre_act_getpass
      mail = @req.query['mail']

      if mail.nil?
	user = @req.user
	if ! @site.is_open? && user && !@site.member.exist?(user)
	  raise RequireMember
	end

	return getpass_show_form
      end

      if ! MailAddress.valid?(mail)
	return c_nerror(_('Invalid mail address')) {
	  [[:p, [:em, mail], [:br],
	      _('The mail address format is wrong.'), [:br],
	      _('Please confirm the input again.')],
	    [:p, [:a, {:href=>'.getpass'}, _('Please access again.')]]]
	}
      end

      if ! @site.is_open? && ! @site.member.exist?(mail)
	ml = @site.ml_address
	return getpass_not_member(mail, ml)
      end

      passmail = generate_password_mail(mail)
      sendmail = Sendmail.new(@config.smtp_host, @config.smtp_port,
			      @config.test)
      begin
	sendmail.send(passmail)
      rescue
	return c_nerror(_('Send Password Error')) {
	  [[:p, _('Send failed for system error.')],
	    [:p, _('Please contact administrator.')],
	    [:p, [:a, {:href=>'.login'}, _('Go back to Login')]]]
	}
      end

      return c_notice(_('Send Password done')) {
	[[:p, {:style=>'margin: 1.5em 0'},
	    _('I send the password to this mail address.'), [:br],
	    _('Please check your mailbox.')],
	  [:p, {:style=>'margin: 1.5em 0'}, [:em, mail]],
	  [:hr],
	  [:p, [:a, {:href=>'.login'}, _('Go back to Login')]]]
      }
    end

    def getpass_show_form
      c_notice(_('Get Password')) {
	[[:h2, _('You will get the password by e-mail.')],
	  [:p, _('Please input your mail address.')],
	  [:form, {:action=>'.getpass',
	      :style=>'text-align: center; margin: 32px 0 48px;'},
	    [:div, {:style=>'margin: 16px 0 8px'},
	      [:em, _('Mail address'), ': '], 
	      [:input,
		{:name=>'mail', :size=>'40', :istyle=>'3', :class=>'focus'}]],
	    [:div, {:class=>'rightbutton'},
	      [:input, {:type=>'submit', :value=>_('Send')}]]],
	  [:p, [:a, {:href=>'.login'}, _('Go back to Login')]]]
      }
    end

    def getpass_not_member(user, ml)
      c_nerror(_('Member Only')) {
	  [[:p, _('You input this e-mail address as user id.'), [:br],
	    [:strong, user]],
	  [:p, _('This user id is not a member of this group.'), [:br],
	    [:strong, ml]],
	  [:p, _('Only the member of this group can get password.')],
	  [:p, [:a, {:href=>'.getpass'}, _('Go back')]]]
	}
    end

    private

    def generate_password_mail(user)
      host_url   = @site.host_url
      site_url   = @site.site_url
      ml_address = @site.ml_address
      password   = @memory.passgen.generate(user)

      mail         = Mail.new
      mail.from    = ml_address
      mail.to      = user

      mail.subject = _('Your password on')+" #{host_url}"
      msg = ''
      msg << _('This is your user name and the password on ')+host_url+"\n"
      msg << "\n"
      msg << _('Username')+":	#{user}\n"
      msg << _('Password')+":	#{password}\n"
      msg << "\n"
      msg << _('Please access login page on')+" #{site_url}.login\n"
      msg << "\n"
      msg << _('You can input user and pass from this URL automatically.')+"\n"
      msg << "#{site_url}.login?user=#{user}&pass=#{password}\n"
      accept_languages = @req.accept_language

      mail.content = msg
      return mail
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  require 'qwik/test-module-public'
  $test = true
end

if defined?($test) && $test
  class TestActGetPass < Test::Unit::TestCase
    include TestSession

    def test_private_site
      # Try to see a get password page, but you can't.
      res = session('/test/.getpass')
      ok_title('Member Only')

      # But you can see the page without login.
      res = session('/test/.getpass') {|req|
	req.cookies.clear
      }
      ok_title('Get Password')

      t_add_user
      ok_eq(",user@e.com,\n", @site['_SiteMember'].load)
      ok_eq(false, @site.is_open?)

      # See get password page.
      res = session('/test/.getpass')
      ok_title('Get Password')
      ok_in(['Get Password'], 'h1')
      ok_xp([:input, {:istyle=>'3', :size=>'40', :class=>'focus',
		:name=>'mail'}], '//input')
      ok_xp([:input, {:value=>'Send', :type=>'submit'}], '//input[2]')

      # Invalid mail address
      res = session('/test/.getpass?mail=wrong@mail@address')
      ok_title('Invalid mail address')

      # You can not get pass if you are not a member.
      res = session('/test/.getpass?mail=guest@example.com')
      ok_title('Member Only')

      # Input your mail address
      res = session('/test/.getpass?mail=user@e.com')
      ok_title('Send Password done')
      ok_in(['user@e.com'], 'em')
      ok_eq(['test@example.com', 'user@e.com'], $smtp_sendmail[2..3])
      assert_match(/user@e.com/, $smtp_sendmail[4])
      assert_match(/95988593/, $smtp_sendmail[4])
      header =
"From: test@example.com
To: user@e.com
Subject: Your password on http://example.com/
Content-Type: text/plain; charset=\"ISO-2022-JP\"

"
      body = 'This is your user name and the password on http://example.com/

Username:	user@e.com
Password:	95988593

Please access login page on http://example.com/test/.login

You can input user and pass from this URL automatically.
http://example.com/test/.login?user=user@e.com&pass=95988593

'.set_sourcecode_charset
      ok_eq(header+body.to_mail_charset, $smtp_sendmail[4])

      # Input your mail address in Japanese mode.
      res = session('/test/.getpass?mail=user@e.com') {|req|
	req.accept_language = ['ja']
      }
      ok_title('パスワード送信完了')
      ok_in(['user@e.com'], 'em')
      ok_eq(['test@example.com', 'user@e.com'], $smtp_sendmail[2..3])
      assert_match(/user@e.com/, $smtp_sendmail[4])
      assert_match(/95988593/, $smtp_sendmail[4])
      header =
"From: test@example.com
To: user@e.com
Subject: =?ISO-2022-JP?B?GyRCJVElOSVvITwlSRsoQiA=?=: http://example.com/
Content-Type: text/plain; charset=\"ISO-2022-JP\"

"
      body =
'このサイトにおけるユーザ名とパスワードです : http://example.com/

ユーザ名:	user@e.com
パスワード:	95988593

ログインページにアクセスしてください : http://example.com/test/.login

下記URLにアクセスすると、自動的にユーザー名とパスワードを入力します。
http://example.com/test/.login?user=user@e.com&pass=95988593

'.set_sourcecode_charset
      str = header+body.to_mail_charset
#      puts str
#      puts $smtp_sendmail[4]
      ok_eq(str, $smtp_sendmail[4])
    end

    def nu_test_obsolete_format
      t_add_user
      res = session('/test/GetPass.html')
      ok_in(['Get Password'], 'title')
    end

    def test_open_site
      t_site_open

      # You can see the page.
      res = session('/test/.getpass')
      ok_title('Get Password')

      # You can get any pass.
      res = session('/test/.getpass?mail=user@e.com')
      ok_title('Send Password done')

      res = session('/test/.getpass?mail=guest@example.com')
      ok_title('Send Password done')
    end
  end

  class TestPasswordMailGenerator < Test::Unit::TestCase
    include TestSession
    include TestModulePublic

    def test_getpass_mail
      res = session('/test/')

      # test_generate_password_mail
      t_make_public(Qwik::Action, :generate_password_mail)
      mail = @action.generate_password_mail('user@e.com')
      ok_eq('test@example.com', mail.from)
      ok_eq('user@e.com', mail.to)
      ok_eq('Your password on http://example.com/', mail.subject)
      ok_eq("This is your user name and the password on http://example.com/\n\nUsername:\tuser@e.com\nPassword:\t95988593\n\nPlease access login page on http://example.com/test/.login\n\nYou can input user and pass from this URL automatically.\nhttp://example.com/test/.login?user=user@e.com&pass=95988593\n", mail.content)

      @action.instance_eval {
	cf = @memory.catalog
	catalog = cf.get_catalog('ja')
	set_catalog(catalog)
      }

      mail = @action.generate_password_mail('user@e.com')
      ok_eq('test@example.com', mail.from)
      ok_eq('user@e.com', mail.to)
      ok_eq('パスワード : http://example.com/', mail.subject)
      ok_eq("このサイトにおけるユーザ名とパスワードです : http://example.com/\n\nユーザ名:\tuser@e.com\nパスワード:\t95988593\n\nログインページにアクセスしてください : http://example.com/test/.login\n\n下記URLにアクセスすると、自動的にユーザー名とパスワードを入力します。\nhttp://example.com/test/.login?user=user@e.com&pass=95988593\n", mail.content)
    end

    def test_mail_example_org
      site = @site
      page = site.create('_SiteConfig')
      page.store(':siteurl:http://example.org/
:siteml:info@example.org
')

      res = session('/test/')
      ok_title('Member Only')

      t_add_user
      res = session('/test/')
      ok_title('FrontPage')

      t_make_public(Qwik::Action, :generate_password_mail)
      mail = @action.generate_password_mail('user@e.com')
      ok_eq('info@example.org', mail.from)
      ok_eq('user@e.com', mail.to)
      ok_eq('Your password on http://example.org/', mail.subject)
      str = "This is your user name and the password on http://example.org/\n\nUsername:\tuser@e.com\nPassword:\t95988593\n\nPlease access login page on http://example.org/.login\n\nYou can input user and pass from this URL automatically.\nhttp://example.org/.login?user=user@e.com&pass=95988593\n"
      ok_eq(str, mail.content)
    end

  end
end
