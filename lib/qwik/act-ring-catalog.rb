#
# Copyright (C) 2003-2005 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'

module Qwik
  class Action
    def _r(text)
      catalog = ring_catalog
      t = catalog[text]
      return t if t

      # Try to reload.
      @memory[:ring_catalog] = ring_generate_catalog
      catalog = ring_catalog
      t = catalog[text]
      return t if t

      raise if @config.test	# Only for test.

      return text.to_s
    end

    def ring_catalog
      if @memory[:ring_catalog].nil?
	@memory[:ring_catalog] = ring_generate_catalog
      end
      return @memory[:ring_catalog]
    end

    def ring_generate_catalog
      catalog = {
	# test
	:TEST => "�e�X�g",

	# common
	:RIGHT_ARROW => "��",
	:BULLET => "��",
	:USER => "���[�U��",
	:YOUR_MAIL => "���Ȃ��̃��[��",
	:YOUR_USER => "���Ȃ��̃��[�U��",
	:YOUR_NAME => "���Ȃ��̖��O",
	:MAIL => "���[��",
	:USER_NAME => "���[�U�l�[��",
	:MESSAGE => "���b�Z�[�W",
	:REALNAME => "�{��",
	:THANKYOU => "�ǂ������肪�Ƃ��������܂����B",
	:CONFIRM_YOUR_INPUT => "������x���͂��m�F���Ă��������B",
	:GOBACK => "�u���E�U�́u�߂�{�^���v�œ��͉�ʂɖ߂�A������x���͂��m�F���Ă��������B",

	# act-ring-invite.rb
	:INVITE_INPUT_GUEST_MAIL =>"���҂������l�̃��[���A�h���X����͂��Ă��������B",
	:INVITE_MESSAGE_DUMMY_TEXT => "SFC-Ring�ɏ��҂��܂��B",
	:INVITE_DESC => '���̕��ʂƋ��ɁA���҂���l�ɑ����܂��B���̕��ʂƋ��ɏ��ҏ�ꗗ�ɕ\������܂��B',
	:INVITE_DO_INVITE => " ���҂���! ",
	:INVITE_NOSEND => "���ҏ�͑����܂���ł���",
	:INVITE_INPUT_MAIL => "���[���A�h���X����͂��Ă�������",
	:INVITE_MAIL_IS_SENT => "���ҏ󂪑����܂���",
	:INVITE_SUBJECT => "SFC-Ring�ւ̂�����",

	# act-ring-maker.rb
	:MAKER_USER_NAME_DESC => 'SFC-Ring�ŕ\������閼�O�ł��B�A���t�@�x�b�g�A�Ђ炪�ȁA�������ȁA�����Ȃǂ��g���܂��B�L���A�󔒂͎g���܂���B��: katokan�A�J�g�J���A���Ƃ���A�������A�ȂǂȂǁB',
	:NYUUGAKU_GAKUBU => "���w�w��",
	:FACULTY_SS => "��������",
	:FACULTY_EI => "�����",
	:FACULTY_KI => "�Ō���",
	:FACULTY_SM => "����E���f�B�A",
	:NYUUGAKU_NENDO => "���w�N�x",
	:MAKER_REGISTER => " �o�^����! ",
	:MAKER_ALREADY_REGISTERD => "���łɓo�^����Ă��܂��B",
	:MAKER_GOBACK_AND_CONFIRM => "�u���E�U�́u�߂�{�^���v�œ��͉�ʂɖ߂�A������x���͂��m�F���Ă��������B",
	:MAKER_NOT_REGISTERD => "�o�^����܂���ł����B",
	:MAKER_REGISTERD => "�o�^����܂���",
	:MAKER_THE_PAGE => "������y�[�W",
	:MAKER_SEE => "������B",

	# act-ring-msg.rb
	:MSG_INPUT_HERE => "�����Ƀ��b�Z�[�W����͂��Ă��������B",
	:MSG_INPUT_MESSAGE => "���b�Z�[�W����͂��Ă�������",
	:MSG_MESSAGE_IS_ADDED => "���b�Z�[�W��ǉ����܂���",

	# act-ring-new.rb
	:NEW_CREATED => "�A�J�E���g���쐬����܂����B",
	:NEW_FROM_SFCNEJP => "sfc.ne.jp���̓o�^�ł��B",

	# act-ring-user.rb
	:USER_NAME => "���O",
	:USER_NYUGAKU => "���w",
	:USER_YEAR => "�N",
      }
      return catalog
    end
    private :ring_generate_catalog
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActRingCatalog < Test::Unit::TestCase
    include TestSession

    def test_all
      res = session
      ok_eq("�e�X�g", @action._r(:TEST))
    end
  end
end
