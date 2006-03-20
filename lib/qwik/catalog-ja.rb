module Qwik; end

class Qwik::CatalogFactory
  def self.catalog_ja
    {
      # for test
      'hello' => '����ɂ���',

      # Error
      'Error' => '�G���[',
      'Failed' => '���s',
      'No message' => '���b�Z�[�W������܂���',
      'No text' => '�e�L�X�g������܂���',

      # action.rb
      'No such site' => '�Ή�����T�C�g������܂���',
      'no correspond site' => '�Ή�����T�C�g�͂���܂���',
      'Please send mail to make a site' =>
      'qwikWeb�̃T�C�g�����ɂ́A�܂����[���𑗂�K�v������܂��B',
      'Login' => '���O�C��',
      'Access here and see how to.' => '�ɃA�N�Z�X���āA�g�����������������B',
      'Please login.' => '���O�C�����Ă�������',
      'Member Only' => '�����o�[��p',
      'You are now logged in as this user id.' =>
      '���Ȃ��͍����̃��[�UID�Ń��O�C�����Ă��܂�',
      'You are now logged in yet.' =>
      '���Ȃ��͂܂����O�C�����Ă��܂���',
      'If you would like to login as another account,' =>
      '�ʂ̃��[�UID�Ń��O�C�����Ȃ��������ꍇ�́A',
      'do logout at the first.' => '�܂����O�A�E�g���Ă�������',
      ': access here, and login again.' =>
      '���Ă���ēx�A�N�Z�X���Ă��������B',
      'You need login to use this function.' =>
      '���̋@�\�𗘗p����ɂ̓��O�C������K�v������܂��B',
      'Go back' => '�߂�',
      'Need POST' => 'POST���͂��K�v',
      'This function needs POST method.' =>
      '���̑����POST���͂ōs���K�v������܂��B',
      'Page not found.' => '�y�[�W��������܂���',
      "Push create if you'd like to create the page." =>
      '�y�[�W���쐬�������ꍇ�́A�V�K�쐬�������Ă�������',

      'Require no path args' => '�ςȃp�X�����Ă܂�',
      'Path argments are not acceptable.' =>
      '�Ȃɂ��ςȃp�X����������Ă܂��B',

      'Not found.' => '����܂���',
      'Access here.' => '��������������������B',

      # act-album
      'Show album in fullscreen.' => '�A���o�����t���X�N���[���Ō���',

      # act-archive
      'site archive' => '�T�C�g�A�[�J�C�u',

      # act-attach
      'Files' => '�Y�t�t�@�C��',
      'del' => '����',
      'download' => '�_�E�����[�h',
      'No such file' => '�t�@�C����������܂���',
      'There is a file with same file name.' =>
      '�����̃t�@�C�������݂��Ă��܂�',
      'Can not use Japanese character for file name' =>
      '���{��̃t�@�C�����͎g���܂���',
      'The file is saved.' => '�t�@�C�����Z�[�u���܂����B',
      'Attach file done' => '�t�@�C����Y�t���܂���',
      'Attach file' => '�t�@�C���Y�t',
      'Attach a file' => '�t�@�C����Y�t���܂�',
      'Confirm to delete a file' => '�t�@�C�������m�F���',
      "Push 'Delete' to delete a file" =>
      '�u��������v�������ƁC�{���Ƀt�@�C�����������܂��D',
      'Delete' => '��������',
      'Already deleted.' => '���łɏ�������Ă���悤�ł�',
      'Failed to delete.' => '�t�@�C�������Ɏ��s���܂����B��B',
      'The file is deleted.' => '�������܂���',
      'File list' => '���ݓY�t����Ă���t�@�C��',
      # other
      '->' => '��',
      'attach' => '�Y�t����',

      # act-backup
      'The first page.' => '����͍ŏ��̃y�[�W�ł��B',
      'Diff from the previous page' => '�O�񂩂�̍���',
      'Original data' => '���f�[�^',
      '<-' => '��',
      'newest' => '�ŐV',
      'backup list' => '�o�b�N�A�b�v�ꗗ',

      # act-basic-plugin
      'newpage' => '�V�K�쐬',
      'edit' => '�ҏW',
      'wysiwyg' => '���̏�ŕҏW',
      'Last modified' => '�ŏI�X�V',
      'Generate time' => '��������',
      'sec.' => '�b',
      'SiteMenu' => '�T�C�g���j���[',
      'SiteConfig' => '�T�C�g�ݒ�',
      'TimeLine' => '�N�\ ',
      'Group members' => '�O���[�v�����o�[',
      'SiteArchive' => '�T�C�g�A�[�J�C�u',
      'ML Config' => '���[�����O���X�g�ݒ�',

      'Functions' => '�@�\�̐���',
      'Page List' => '�y�[�W�ꗗ',
      'Recent Changes' => '�X�V����',
      ' ago' => '�O',
      'more...' => '�����ƑO�̏��',
      'min.' => '��',
      'hour' => '����',
      'day' => '��',
      'month' => '����',
      'year' => '�N',
      'century' => '���I',

      # act-comment
      'User' => '���[�U��',
      'Message' => '���b�Z�[�W',
      'Message is added.' => '���b�Z�[�W��ǉ����܂���',

      # act-config
      'Site config'	=> '�T�C�g�ݒ�',

      # act-chronology
      'Time walker' => '���ԗ��s',
      'Chronology' => ' �N�\ ',

      # act-day
      'A day' => '���',

      # act-describe
      'Function' => '�@�\����',
      'Functions list' => '�@�\�ꗗ',

      # act-edit.rb
      'Page is deleted.' => '�y�[�W���폜���܂���',
      'Password does not match.' => '�p�X���[�h����v���܂���ł����B',
      'Password' => '�p�X���[�h',
      'Please find a line like above, then input password in parentheses.' =>
      '���̂悤�ȍs��T���āA���ʂ̒��Ƀp�X���[�h����͂��Ă��������B',

      'Page edit conflict' => '�X�V���Փ˂��܂����B',
      'Please save the following content to your text editor.' =>
      '���L�̓��e���e�L�X�g�G�f�B�^�Ȃǂɕۑ����A',
      'Newest page' => '�ŐV�̃y�[�W',
      ': see this page and re-edit again.' => '���Q�ƌ�ɍĕҏW���Ă��������B',
      'Page is saved.' => '�y�[�W��ۑ����܂����B',

      'Save' => '�ۑ�',
      'Attach' => '�Y�t',

      'Edit' => '�ҏW',
      'Attach Files' => '�t�@�C���Y�t',
      'Attach many files' => '�����Ƃ�������Y�t����',

      'Help' => '�w���v',
      'How to qwikWeb' => 'qwikWeb�̎g����',

      'Site admin' => '�T�C�g�Ǘ�',

      'Header' => '���o��',
      'List' => '�ӏ��� ',
      'Ordered list' => '�������X�g ',
      'Blockquote' => '���p ',
      'Word' => '��`',
      'Definition' => '���t�̒�` ',
      'Table' => '�\ ',
      'Emphasis' => '����',
      'Strong' => '�����Ƌ���',
      'Link' => '�����N',
      'more help' => '�����Əڂ�������',

      'Text Format' => '�����ꗗ',
      'History' => '����',
      'Backup' => '�o�b�N�A�b�v',
      'Time machine' => '�^�C���}�V�[��',
#      'Experimental functions' => '�������̋@�\ ',
      'Page functions' => '�y�[�W�̋@�\ ',

      # act-getpass
      'Invalid mail address' => '�p�X���[�h�`���G���[',
      'Get Password' => '�p�X���[�h����',
      'Send Password' => '�p�X���[�h���M',
      'You will get the password by e-mail.' => '�p�X���[�h�����[���ő���܂�',
      'Please input your mail address.' => '���[���A�h���X����͂��Ă�������',
      'Mail address' => '���[���A�h���X',
      'Go back to Login' => '���O�C����ʂɂ��ǂ�',

      'Send' => '���M',

      'You input this e-mail address as user id.' =>
      '���Ȃ��̓��[�UID�Ƃ��Ă��̃��[���A�h���X����͂��܂���',
      'This user id is not a member of this group.' =>
      '���̃��[�UID�́A���̃O���[�v�ɂ͊܂܂�Ă��܂���',
      'Only the member of this group can get password.' =>
      '���̃O���[�v�̃����o�[�́A�p�X���[�h���擾�ł��܂��B',

      'Your password on' => '�p�X���[�h :',
      'This is your user name and the password on ' =>
      '���̃T�C�g�ɂ����郆�[�U���ƃp�X���[�h�ł� : ',
      'Username' => '���[�U��',
      'Password' => '�p�X���[�h',
      'Please access login page on' =>
      '���O�C���y�[�W�ɃA�N�Z�X���Ă������� :',
      'You can input user and pass from this URL automatically.' =>
      '���LURL�ɃA�N�Z�X����ƁA�����I�Ƀ��[�U�[���ƃp�X���[�h����͂��܂��B',

      'The mail address format is wrong.' =>
      '���[���A�h���X�̌`�����Ԉ���Ă܂��B',
      'Please confirm the input again.' => '������x���͂��m�F���Ă��������B',
      'Please access again.' => '�ēx�A�N�Z�X���Ă��������B',
      'Send Password Error' => '���[�����M�G���[',
      'Send failed for system error.' =>
      '�V�X�e���G���[�̂��߁A�p�X���[�h���M�Ɏ��s���܂����B',
      'Please contact administrator.' => '�V�X�e���Ǘ��҂ɂ��A���������B',

      'Send Password done' => '�p�X���[�h���M����',
      'I send the password to this mail address.' =>
      '�p�X���[�h���ȉ��̃��[���A�h���X�ɑ��M���܂����B',
      'Please check your mailbox.' => '���[���{�b�N�X���m�F���Ă�������',

      # act-group
      'Member list' => '�����o�[�ꗗ',

      # act-hcomment
      'Name' => '�����O',
      'Comment' => '�R�����g',
      'Anonymous' => '����������',
      'Add a comment.' => '�R�����g��ǉ����܂���',
      'Submit' => '���e',
      'Page collision is detected.' => '�X�V���Փ˂��܂���',
      'Go back and input again.' => '���̃y�[�W�ɖ߂�A�ēx���͂��Ă��������B',

      # act-history
      'Time machine' => '�^�C���}�V�[��',
      'Move this' => '����𓮂����ĉ�����',

      # act-license
      'You can use the files on this site under [[Creative Commons by 2.1|http://creativecommons.org/licenses/by/2.1/jp/]] license.' =>
      '�����ɒu���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y�A�� 2.1|http://creativecommons.org/licenses/by/2.1/jp/]]���C�Z���X�̉��ɗ��p�ł��܂��B',
      'You can use the files on this site under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      '�����ɒu���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y �A�� - ����������� 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]���C�Z���X�̉��ɗ��p�ł��܂��B',
      'The files you uploaded will be under [[Creative Commons Attribution-ShareAlike 2.5|http://creativecommons.org/licenses/by-sa/2.5/]] license.' =>
      '�����ɃA�b�v���[�h���ꂽ�t�@�C���́A[[�N���G�C�e�B�u�E�R�����Y �A�� - ����������� 2.5|http://creativecommons.org/licenses/by-sa/2.5/]]���C�Z���X�̉��ɒu����܂��B',

      # act-login
      'Logout' => '���O�A�E�g',
      'Login by Session' => 'Session�ɂ�郍�O�C��',
      'succeed' => '����',
      'Go next' => '����',
      'Session ID Auth' => 'Session ID�F��',
      'or, Access here.' => '�܂��́A������������p�������B',
      'Login by using Basic Auth.' => 'Basic�F�؂Ń��O�C�����܂����B',
      'Login by Basic Auth' => 'Basic�F�؂Ń��O�C��',
      'Do login by Basic Auth.' => 'Basic�F�؂Ń��O�C�����܂��B',
      'Login by cookie' => 'cookie�ɂ�郍�O�C��',
      'You are already login by cookie.' => '����cookie�Ń��O�C�����Ă��܂��B',

      'Login Error' => '���O�C���G���[',
      'Invalid ID(E-mail) or Password.' =>
      '���[�UID(E-mail)�������̓p�X���[�h���Ⴂ�܂�',

      'Already logged in' => '���O�C���ς�',

      'Please confirm the mail again.' =>
      '���͂ɊԈႢ���Ȃ����ǂ���������x���[�������m�F���������B',
      '(Please do not use copy & paste.  Please input the password from keryboard again.)' => '(�R�s�[&�y�[�X�g���ƃG���[�ɂȂ�ꍇ������܂��B���̏ꍇ�͂��萔�ł����L�[�{�[�h������͂��Ă݂Ă�������)',
      'Can not logout.' => '���O�A�E�g�ł��܂���',
      'You can not logout in Basic Auth mode.' =>
      'Basic�F�؂̏ꍇ�̓��O�A�E�g�ł��܂���B',
      'Please close browser and access again.' =>
      '��U�u���E�U����āA�ēx�A�N�Z�X���Ă��������B',
      'Terminal Number is deleted.' => '�[���ԍ����폜���܂���',
      'Basic Auth' => 'Basic�F��',
      'For mobile phone user' => '�g�ѓd�b�̕��͂������',
      'Logout done.' => '���O�A�E�g����',
      'Confirm' => '�m�F',
      "Push \"Do Logout\"." =>
      '�u���O�A�E�g����v�������ƁA�{���Ƀ��O�A�E�g���܂��B',
      'Do Logout' => '���O�A�E�g����',

      'Login to ' => '���O�C�����܂� : ',
      'Please input ID(E-mail) and password.' =>
      '���[�UID�ƃp�X���[�h����͂��Ă�������',
      'ID' => '���[�UID',
      'Password' => '�p�X���[�h',

      "If you don't have password, " => '�p�X���[�h���������łȂ�����',
      'access here' => '�����������������',
      "If you don't have password" => '�p�X���[�h���܂������ĂȂ�?',
      'For mobile phone user, please use' =>
      '�g�ѓd�b�̕��́A������������p������',
      'You can also use TypeKey' => 'TypeKey���g���܂�',
      'Login by TypeKey' => 'TypeKey�Ń��O�C��',

      # act-member
      'Add a member' => '�����o�[�ǉ�',
      'Mail address to add' => '�ǉ����郁�[���A�h���X',
      'Add' => '�ǉ�',
      'Invalid Mail' => '�����ȃ��[���A�h���X',
      'Already exist' => '���łɑ��݂��Ă܂�',
      'Member added' => '�����o�[�͒ǉ�����܂���',
      'Member list' => '�����o�[�ꗗ',
      'Member' => '�����o�[',

      # act-mlsubmitform
      'Mlcommit' => '���e����B',

      # act-pagelist
      'Recent change' => '�ŐV�̍X�V',

      # act-plan
      'Plan' => '�\��',
      'New plan' => '�V�����\��',
      'Create a new plan' => '�V�����\��̓o�^',

      # act-schedule
      'Schedule' => '�X�P�W���[��',
      'Date' => '���t',
      'Schedule edit done.' => '�X�P�W���[������͂��܂����B',

      # act-slogin
      'Session ID is registerd.' => 'Session ID��o�^���܂����B',

      # act-style
      'Access Failed' => '�A�N�Z�X�ł��܂���ł���',

      # act-map
      'Show map in fullscreen.' => '�n�}���t���X�N���[���Ō���',

      # act-mcomment
      'Failed' => '���s���܂���',

      # act-mdlb
      'Please specify file.' => '�t�@�C�����w�肵�Ă��������B',
      'Please contact the administrator.' => '�Ǘ��҂ɘA�����Ă��������B',
      'The file is saved as this filename.' =>
      '���̃t�@�C�����ŃZ�[�u����܂����B',
      'The image is also saved.' =>
      '�摜�t�@�C�����Z�[�u����܂����B',
      'Model file' => '���f���t�@�C��',
      'Image file' => '�摜�t�@�C��',

      # act-mdblb-model
#      'Title' => '�^�C�g��',
      'Author' => '���',
#      'Comment' => '�R�����g',
      'Download' => '�_�E�����[�h',

      # act-new
      'Push create.' => '�V�K�쐬�������Ă��������B',
      'New page' => '�V�K�쐬',
      'Title' => '�^�C�g��',
      'PageKey' => '�y�[�W�L�[',
      'Already exist' => '���łɑ��݂��Ă��܂�',
      ' is already exist.' => '�͂��łɑ��݂��Ă��܂��B',
      'Please specify another title.' => '�Ⴄ�^�C�g�����w�肵�Ă��������B',
      'Created.' => '�쐬���܂���',
      'Edit new page' => '�V�K�y�[�W��ҏW',

      # etc.
      'Show history' => '�ߋ��̕ϑJ��H��',
      'Show backup' => '���܂܂ł̗���',

      # act-presen
      'Presentation mode' => '�v���[�����[�h',
      # other
      'Presen' => '�v���[��',
      'presentation' => '�v���[���e�[�V����',

      # act-search
      'Search' => '����',
      'Search result' => '��������',
      'No match.' => '������܂���ł����B',

      # act-table-edit
      'You can only use a table.' => 'table�����g���܂���B',
      'You can only use text.' => 'text�����g���܂���B',
      'Update' => '�X�V',
      'Edit done.' => '�ҏW����',

      # act-textarea
      'Edit text done.' => '�e�L�X�g��ҏW���܂���',

      # act-takahashi
      'Show in fullscreen.' => '�t���X�N���[���Ō���',

      # act-toc
      'contents' => '�ڎ�',

      # act-typekey
      'Can not use.' => '�g���܂���B',
      'Verify failed.' => '�F�؂ł��܂���ł����B',
      'Time out.' => '���Ԑ؂�ł��B',

      # act-wysiwyg
      'Edit in this page' => '���̏�ŕҏW',
      'Auto save' => '�����ۑ�',
      'This is experimental function.' => '���̋@�\�͂܂��������ł��B',
      'The contents will be translated to html.' =>
      '�y�[�W�̓��e�́A�S��HTML�ɕϊ�����܂��B',
      'Please use this function only if you understand what will happen.' =>
      '�����N��̂��𗝉�����Ă���ꍇ�̂݁A���g���������B',

      # act-wema
      'How to Post-it' => '��Ⳃ̎g����',
      'New post-it is created.' => '�tⳂ�V�K�ɍ쐬���܂���',
      'Edit done.' => '�ҏW���܂���',
      'No action.' => '�������܂���ł���',
      'Delete a Post-it.' => '�tⳂ��������܂���',
      'Set position.' => '�ʒu���Z�b�g���܂���',
      'Post-it' => '���',
      'New Post-it' => '�V�K���',
      'help' => '�g����',
      'Draw Line' => '��������',
      'Text color' => '�����F',
      'Background' => '�w�i�F',

      # Add you catalog here.
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
      '' => '',
    }
  end
end
