#
# Copyright (C) 2003-2006 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

module Qwik
  class Action
    Dja_album = {
      :dt => '�A���o���E�v���O�C��',
      :dd => '�Y�t���ꂽ�摜�t�@�C������x�Ɍ��邱�Ƃ��ł��܂��B',
      :dc => '* ��
 {{album}}
{{album}}

����͐�����ʂ̂��߁A�����ɂ̓A���o���͕\������܂���B

* ����
�_�� �[��ɂ��u�Ȃ߂炩�A���o���v�@�\���g�p���Ă���܂��B
���ӂ������܂��B
' }

    Dja_calc = {
      :dt => '�v�Z�v���O�C��',
      :dd => '�ȒP�ȕ\�v�Z���s�����Ƃ��ł��܂��B',
      :dc => "* ��
 {{calc
 ,$100	,CPU
 ,$100	,Memory
 ,$20.5	,Cable
 ,$250	,Graphic Card
 ,$250	,HDD
 ,$400	,Mother Board
 }}
{{calc
,$100	,CPU
,$100	,Memory
,$20.5	,Cable
,$250	,Graphic Card
,$250	,HDD
,$400	,Mother Board
}}
"
    }

    Dja_code = {
      :dt => '�R�[�h�E�v���O�C��',
      :dd => '�y�[�W���ɃR�[�h�����߂��ނƂ��Ɏg���܂��B',
      :dc => "* ��

 {{code
 puts \"hello, world!\"
 puts \"hello, qwik users!\"
 }}
{{code
puts \"hello, world!\"
puts \"hello, qwik users!\"
}}

{{code
\#include <stdio.h>

void main(){
  printf(\"hello, world!\\n\");
}
}}
" }

    Dja_comment = {
      :dt => '�R�����g�v���O�C��',
      :dd => '�R�����g���͗���\�����܂��B',
      :dc => "
* �����s�R�����g�v���O�C��
{{mcomment}}
 {{mcomment}}
�����s�̃R�����g�v���O�C���ł��B
 {{mcomment(1)}}
���̂悤�ɁA(1)������ƁA�V�����R�����g����ԏ�ɂ��悤�ɂȂ�܂��B
* Hiki���R�����g�v���O�C��
{{hcomment}}
 {{hcomment}}
Hiki�̃R�����g�v���O�C���Ƃقړ����g�����ł��B
* ���R�����g�v���O�C��
{{comment}}
 {{comment}}
�Â��d�l�̃R�����g�v���O�C���ł��B
���ɁA�umcomment�v�v���O�C�������g�����������B
" }

    Dja_describe = {
      :dt => '�@�\����',
      :dd => 'qwikWeb�̋@�\���������邱�Ƃ��ł��܂��B',
      :dc => '* ��
 [[isbn.describe]]
[[isbn.describe]]

�@�\�����̈ꗗ�́A���̉��ɂ��Ă��܂��B
'
    }

    Dja_embed_html = {
      :dt => 'html���ߍ��݋@�\ ',
      :dd => 'html�����̂܂܂͂肱�ނ��Ƃ��ł��܂��B',
      :dc => "* ��
 <html>
 s<sup>5</sup>
 </html>
<html>
s<sup>5</sup>
</html>
����Ȋ����B
�C�ӂ̃^�O���g����킯�ł͂Ȃ��C�g����v�f�͌����Ă��܂��D

<html>
<H3>���o��2</H3>
<H4>���o��3</H4>
<H5>���o��4</H5>
<H6>���o��5</H6>
<UL>
<LI>�ӏ������x��1
<UL>
<LI>�ӏ������x��2
<UL>
<LI>�ӏ������x��3</LI></UL></LI></UL></LI></UL>
<OL>
<LI>�������X�g1
<OL>
<LI>�������X�g2
<OL>
<LI>�������X�g3</LI></OL></LI></OL></LI></OL><PRE>���`�ς݃e�L�X�g�B</PRE>
<BLOCKQUOTE>
<P>���p�B</P></BLOCKQUOTE>
<DL>
<DT>Wiki
<DD>�������݉\��Web�y�[�W
<DT>QuickML
<DD>�ȒP�ɍ��郁�[�����O���X�g�V�X�e��</DD></DL>
<TABLE>
<TBODY>
<TR>
<TD>����1-1</TD>
<TD>����1-2</TD>
<TD>����1-3</TD></TR>
<TR>
<TD>����2-1</TD>
<TD>����2-2</TD>
<TD>����2-3</TD></TR></TBODY></TABLE>
<P><EM>����</EM>�A<STRONG>����ɋ���</STRONG>�A<DEL>��������</DEL> <A href=\"http://qwik.jp/.theme/new.png\">new</A> <A href=\"FrontPage.html\">FrontPage</A> <A href=\"http://www.yahoo.co.jp/\">Yahoo!</A></P>

<PLUGIN param=\"1\" method=\"recent\"></PLUGIN>
</html>

�v���O�C���̎w����@���A������������ł��ˁB
�܂��Ahtml�v���O�C���̒��ł͎g���Ȃ��v���O�C��������܂��B
"
    }

    Dja_files = {
      :dt => '�t�@�C���Y�t�@�\ ',
      :dd => '�y�[�W�Ƀt�@�C����Y�t�ł��܂��B',
      :dc => '
* �y�[�W�ւ̃t�@�C���Y�t
�܂��ҏW��ʂɍs���܂��B
�y�[�W�̈�ԉ��ɁA�t�@�C���Y�t�̂��߂̃t�H�[��������܂��B
�u��������Y�t����v�Ƃ��������N�����ǂ�ƁA��������̃t�@�C������x��
�Y�t���邽�߂̃t�H�[����ʂɂƂт܂��B

�Y�t������ƁA�y�[�W�̈�ԉ��Ɏ����I�ɂ��̓Y�t�t�@�C���ւ̃����N�����܂��B
 {{file(\"somefile.txt\")}}
���̂悤�ɂ��āA���̃y�[�W����Y�t�t�@�C���փA�N�Z�X�ł���悤�ɂȂ�܂��B

* �t�@�C���ꗗ�v���O�C��
 {{show_files}}
�t�@�C���ꗗ��\\���ł��܂��B
' }

    Dja_menu = {
      :dt => '���j���[�v���O�C��',
      :dd => '�v���_�E���^���j���[�����܂��B',
      :dc => "* ��
{{hmenu
- [[Yahoo!|http://www.yahoo.co.jp/]]
-- [[map|http://map.yahoo.co.jp/]]
-- [[auctions|http://aunctions.yahoo.co.jp/]]
- [[Google|http://www.google.co.jp/]]
-- [[news|http://news.google.com/]]
-- [[map|http://map.google.com/]]
- [[qwik|http://qwik.jp/]]
-- [[hello|http://qwik.jp/HelloQwik/]]
}}

{{br}}
{{br}}
{{br}}
{{br}}
" }

    Dja_presen = {
      :dt => '�v���[���E���[�h',
      :dd => '�v���[���E���[�h�ŕ\�����܂��B',
      :dc => '* ��
 [[FrontPage.presen]]
[[FrontPage.presen]]

���̃����N�����ǂ�ƁAFrontPage���v���[�����[�h�ŕ\�����܂��B
 {{presen}}
���̃y�[�W���g���v���[�����[�h�ɂ��郊���N��\���������ꍇ�́A
���̃v���O�C���������p�������B
** �v���[���e�[�}�w��
 {{presen_theme(qwikblack)}}
���̂悤�ɂ��āA�v���[���e�[�}���w��ł��܂��B
* ����
�v���[�����[�h�ɂ́AEric Meyer���ɂ��s5���g�p���Ă���܂��B���ӂ������܂��B
' }

    Dja_qwikweb = {
      :dt => 'qwikWeb�@�\�ꗗ',
      :dd => 'qwikWeb�̋@�\�ꗗ�ł��B',
      :dc => '
* �g����
���L�ɁAqwikWeb�̋@�\�ꗗ�������܂��B
'
=begin
# :[[textformat.describe]]:�����ꗗ�ł��B
# * ��{�@�\
# :[[FromMailingList]]:���[�����O���X�g�ɑ���ꂽ���[���́ASubject�ɂ���Ĉ�y�[�W�ɂ܂Ƃ܂�܂��B
# :[[MailSuffix]]:���[���̍Ō�ɁA���[���ɑΉ�����URL���t�L����܂��B
# :[[AttachedImage]]:�Y�t�t�@�C�����K�؂ɏ�������܂��B�摜�ȊO�̓Y�t�t�@�C���́A�A�C�R���Ƃ��ĕ\������܂��B
# * �����ڂ�ς���
# :[[embed_html.describe]]:HTML�R�[�h�𒼐ڂ��̂܂܂������Ƃ��ł��܂��B
# :[[code.describe]]:�v���O�����̃\�[�X�R�[�h���͂肽���Ƃ��ɁB
# :[[aa.describe]]:�A�X�L�[�A�[�g�����������Ƃ��ɁB
# * �l�X�ȃv���O�C��
# :[[search.describe]]:�����@�\�����Ă܂��B
# :[[files.describe]]:�y�[�W�ւ̃t�@�C���Y�t�@�\�B
# :[[include.describe]]:���̃y�[�W�̂Ƃ肱�݁B
# :[[comment.describe]]:�R�����g�������܂��B
# :[[calc.describe]]:�ȒP�ȕ\�v�Z���ł��܂��B
# :[[ActSecurity]]:�Z�L�����e�B�ɂ��C��z���Ă܂��B
# * �g�����ꂽWikiWikiWeb
# :[[wema.describe]]:�y�[�W�ɕ�Ⳃ��͂邱�Ƃ��ł��܂��B
# :[[smil.describe]]:Web�u���E�U����A�݂�Ȃł���Ă������Ĉ�̓��摜��ҏW�ł���d�g�݂ł��B
# :[[�ҏW�����̎Q��|FrontPage.history]]:�ߋ��̗������C���^���N�e�B�u�ɎQ�Ƃł��܂��B
# * �g����
# :[[qwikweb_howto_mobile.describe]]:�g�ѓd�b����̗��p���@�ł��B
# * �C���X�g�[�����@
# :[[qwikweb_config_httpd.describe]]:httpd�̐ݒ���@�ł��B
# * qwikWeb�̊J���ɎQ������
# :[[qwikweb_howto_plugin.describe]]:�v���O�C���̍����ł��B
# :[[ActException]]:�f�o�b�O�����₷���Ȃ��Ă܂��B
# :[[sample.describe]]:�����Ńv���O�C�������̂��ȒP�B
# * ���p��
# :[[Schedule]]:�X�P�W���[�������Ɏg���Ă݂���B
# :[[Class0106]]:���ƋL�^�Ƃ��Ďg���Ă݂���B
# :[[PresenInteraction2005]]:�v���[���Ŏg���Ă݂���B
# * obsolete
# ���͎g���Ȃ��Ȃ������A�l�X�Ȏ����܂��c���Ă���v���O�C���ł��B
# �g��Ȃ��ł��������B
# :[[ActComment]]:�R�����g�������܂��B
=end
    }

    Dja_qwikweb_plugins = {
      :dt => 'qwikWeb�v���O�C���ꗗ',
      :dd => 'qwikWeb�̃v���O�C���ꗗ�ł��B',
      :dc => '
* �v���O�C��
* �v���O�C���ꗗ
qwikWeb�̗l�X�ȃv���O�C�����ꗗ���܂��B

[[qwikWebFunctions]]���������������B

* [[ActSchedule]]
�ȒP�ɓ��t�Ɩ��O�ɂ��\����邱�Ƃ��ł��āA
���̕\�Ɂ��~�����߂Ă������Ƃ��ł��܂��B
�X�P�W���[������������Ƃ��Ɏg���܂��B

# * [[table.describe]]
# �e�[�u�������̏�ŕҏW���邱�Ƃ��ł��܂��B

* [[ActPlan]]
�\��\����邱�Ƃ��ł��܂��B

# * [[menu.describe]]
# ��y�Ƀv���_�E���^�̃��j���[�����܂��B

* [[ActMap]]
�n�}�����߂��ނ��Ƃ��ł��܂��B

# * [[comment.describe]]
# �����s������R�����g�v���O�C���ł��B

* [[ActCounter]]
�J�E���^�[�v���O�C���ł��B

* [[ActHatenaPoint]]
�͂ĂȂ̃A�J�E���g�𖄂ߍ��ނ��Ƃ��ł��܂��B

* [[ActSmil]]
�y�[�W�ɂāA�ǂ̂悤�Ƀ��B�f�I��\�����邩���w�肷�邱�Ƃ��ł��܂��B

* [[ActInclude]]
���̃y�[�W����荞�݂܂��B

* [[ActHtml]]
HTML�v���O�C�����g���ƁAHTML�𒼐ږ��ߍ��߂܂��B
�������A�g����^�O��v�f�ɂ͌����Ă��܂��B
'
    }

    Dja_qwikweb_install = {
      :dt => 'qwikWeb�̃C���X�g�[�����@',
      :dd => 'qwikWeb�̃C���X�g�[�����@�ł��B',
      :dc => "
\'\'���e�ł��B\'\'

* ����
- �_�E�����[�h���Ă��Ă��������B
- �𓀂��Ă��������B

qwikWeb�Ɠ����p�b�P�[�W�ɁAQuickML�̃R�[�h���܂܂�Ă��܂��B
���̂���QuikML��ʓr�_�E�����[�h����K�v�͂���܂���B
"
    }

    Dja_qwikweb_config = {
      :dt => 'qwikWeb�̐ݒ���@',
      :dd => 'qwikWeb�̐ݒ���@�ł��B',
      :dc => "
\'\'���e�ł��B\'\'

* qwikWeb�̐ݒ�t�@�C��
qwikWeb�����ۂɉ^�p���邽�߂ɂ́A
���L�̃t�@�C����ύX����K�v������܂��B
- etc/config.txt

���ꂼ��AqwikWeb�̐ݒ�t�@�C���AQuickML�̐ݒ�t�@�C���ł��B

* qwikWeb�̐ݒ�
- etc/config.txt
qwikWeb�ɂ�����Wiki�����̐ݒ�t�@�C���ł��B
�G�f�B�^�� etc/config.txt ���J���Ă��������B

�u:�v�ł킯���ċL�q����Ă��܂��B
���ꂼ��̍s���ݒ荀�ڂł��B
�z�X�g���͕K�{�ł��B

** Apache�Ƃ̋���
qwikWeb�́A�W���ł�WEBrick���g�p���A�|�[�g9190�ɂ�httpd�Ƃ��ē����܂��B
���̂��߁A
- http://localhost:9190/
�ɃA�N�Z�X����ƁAqwikWeb�ɂ��̂܂܂Ȃ���͂��ł��B

�������A�|�[�g80�ł͂��ł�Apache�������Ă���A���̏�ŁA
- http://localhost/wiki/
�Ƃ������A�h���X�ŉ^�p���������Ƃ�����Ǝv���܂��B
���̏ꍇ��Apache�����o�X�v���L�V�Ƃ��ė��p���āAlocalhost�̃|�[�g9190��
�ڑ�����Ƃ����g�����ɂȂ�܂��B�ڂ����ݒ���@�́A
[[qwikweb_config_httpd]]�������������B

* QuickML�̐ݒ�
- etc/config.txt
���̃t�@�C�����G�f�B�^�ŊJ���Ă��������B
�ݒ�����������܂��B
"
    }

    Dja_qwikweb_config_httpd = {
      :dt => 'qwikWeb�ɂ�����httpd�̐ݒ���@',
      :dd => 'qwikWeb���C���X�g�[������ۂ́AApache�Ȃǂ�httpd�̐ݒ���@�ł��B',
      :dc => '
* Apache���ł̗��p
Port 80��Apache�������Ă���ꍇ�̐ݒ���@�ł��B���ł�Aapche���|�[�g�𗘗p���Ă���̂�mod_proxy����
�@�\�ł��郊�o�[�X�v���L�V�𗘗p����qwik�ŕW���Ŏg�p���Ă���Port 9190��Port 80�ɂ����_�C���N�g���܂��B

���o�[�X�v���L�V�Ɋւ��Ă͈ȉ��̐�����������������
-[[���o�[�X�v���L�V�Ƃ� IT�p�ꎫ�T e-Words|http://e-words.jp/w/E383AAE38390E383BCE382B9E38397E383ADE382ADE382B7.html]]
-[[�t�H���[�h�v���L�V�ƃ��o�[�X�v���L�V Apache HTTP �T�[�o|http://cvs.apache.jp/svn/httpd-docs/2.1/manual/mod/mod_proxy.html.ja.euc-jp#forwardreverse]]
�Ⴆ�΁Awww.example.com�Ƃ����}�V�����Ǘ����Ă��āA
http://www.example.com/ �Ƃ���URL��qwikWeb�𗧂��グ�����Ɖ��肵�܂��B

*Apache1.3�̏ꍇ
�G�f�B�^��httpd.conf���J���܂��B
*Proxy module���g����悤�ɂ���
/etc/apache/httpd.conf �ɕύX�������AProxy module��L���ɂ��܂��B
 LoadModule proxy_module /usr/lib/apache/1.3/libproxy.so

*VirtualHost�̐ݒ�
httpd.conf�Ō�Ɉȉ��̋L�q�𑫂��܂��B
 <VirtualHost www.example.com>
     ProxyPass	/	http://127.0.0.1:9190/
 </VirtualHost>
���̂悤�ɂ����OK�ł��B
(����ProxyPass���g������@�́A���ѓN���ɋ����Ă��������܂����B)

*���̃f�B���N�g����qwik��ݒu�������ꍇ
���� http://www.example.com/qwik/ �Ƃ���URL�ɂ������ꍇ�Ahttp.conf���ȉ��̂悤�ɂ��܂��B
 <VirtualHost www.example.com>
     ProxyPass	/.theme/	http://127.0.0.1:9190/.theme/
     ProxyPass	/qwik/	http://127.0.0.1:9190/
 </VirtualHost>
�ȏ�̂悤���邱�Ƃ�http://www.example.com/qwik/�ŃA�N�Z�X���邱�Ƃ��ł��܂��B
*Apache2�̏ꍇ

*a2enmod��Proxy���W���[����ǉ�
Apache2�̏ꍇmodule�̒ǉ���\'\'a2enmod\'\'�Ƃ����R�}���h���g���܂��B���̃R�}���h��
�g��Proxy���W���[����ǉ����܂��B
 # a2enmod proxy
 Module proxy installed; run /etc/init.d/apache2 force-reload to enable.

*a2enmod��VirtualHost��L����
������a2enmod��VirtualHost��L���ɂ��܂�
 # a2enmod proxy
 Module vhost_alias installed; run /etc/init.d/apache2 force-reload to enable.
�����Apache2��VirtualHost�f�B���N�e�B�u�̐ݒ肪�L���ɂȂ�܂��B
*mods-enabled�ȉ��ɂ���proxy.conf��ҏW
proxy���W���[����ǉ������apache��mods-enabled/�ȉ���proxy.conf,proxy.load���ǉ�����܂��B
Debian�̏ꍇ�Aproxy.conf��/etc/apache2/mods-enabled/�ȉ��ɂ����Ă���܂��B

�G�f�B�^��proxy.conf���J���܂��B�ȉ��̂悤�ɋL�q�����������܂��B
{{{

<IfModule mod_proxy.c>

 ProxyRequests Off

 <Proxy *>
     Order deny,allow
     Allow from all
 </Proxy>

 <VirtualHost www.example.com>
     ProxyPass	/	http://127.0.0.1:9190/
 </VirtualHost>

</IfModule>

}}}
�ȏ�̂悤�ɋL�q������apache���ċN�������܂��B
*mod_proxy�̏ڍ�
mod_proxy�Ɋւ���ڍׂ͈ȉ����Q�Ƃ��Ă�������
-[[mod_proxy - Apache HTTP �T�[�o|http://cvs.apache.jp/svn/httpd-docs/2.1/manual/mod/mod_proxy.html.ja.euc-jp]]
'
    }

    Dja_qwikweb_howto_mobile = {
      :dt => '�g�ѓd�b����̎g����',
      :dd => 'qwikWeb�́A�g�ѓd�b����ł��g���܂��B',
      :dc => "
* �g�ѓd�b

�g�ѓd�b����̗��p���ł��܂����A���낢��Ɛ���������܂��B

* �h�R���̏ꍇ

** i���[�h

���O�C����ʂɂāA�u�g�ѓd�b�̕��͂�����v�Ƃ��������N������܂��B����
����HTTP�F�؂ɂ�郍�O�C�������邱�Ƃ��ł��܂��B�܂����O�C������O�ɁA
�p�X���[�h����肵�A��������ȂǂɃ������Ă����K�v������܂��B

�p�X���[�h�������Ă��郁�[���ɂ́A�u������̃����N��H��Ǝ����I�Ƀ�
�O�C�����܂��v�Ƃ��������N������܂����Ai���[�h�ł�cookie���g���Ȃ���
�߁A���̃����N��H���Ă����O�C�����܂���̂ŁA�䒍�Ӊ������B

** jig�u���E�U

i�A�v�����g�����u���E�U�Ƃ��āAjig�u���E�U������܂��B

- http://jig.jp/

����jig�u���E�U��cookie�ɑΉ����Ă��邽�߁A������g���Ε��ʂɃ��O�C��
�ł��܂��B�܂������قǂƓ��l�Ƀp�X���[�h���������Ă����܂��B����jig�u
���E�U�𗧂��グ�Ă���A���O�C����ʂ��烆�[�U���ƃp�X���[�h����͂���
���B

* ���̉��

WIN�̌g�тł́Acookie�ɑΉ����Ă��邽�߁A���ʂɃ��O�C���ł��邱�Ƃ��m
�F���Ă��܂��B����ȊO�̉�Ђɂ��܂��ẮA���m�F�ł��B

����������m�F����܂�����A���Ђ��A���������B
�� info at qwik.jp
"
    }

    Dja_qwikweb_howto_plugin = {
      :dt => '�v���O�C���̍���',
      :dd => 'qwikWeb�ɂ�����v���O�C���̍����ł��B',
      :dc => '
* �v���O�C���̍���

���̕��͂́C���������ł��D

qwikWeb�̃v���O�C�����ǂ̂悤�Ȏd�g�݂łł��Ă��邩���������B
(qwikWeb��install���@�͏ȗ��B�Ƃ肠�����A���ʂɋN������Ƃ���܂œ���
���Ă��������B)

* act-sample.rb

lib/qwik/act-sample.rb �Ƃ����R�[�h���A�T���v���R�[�h�ł���B

{{code
module Qwik
  class Action
    def plg_hello
      [:strong, \"hello, world!\"]
    end

    def act_hello
      c_ok(\"hello, world!\"){\"hi, there.\"}
    end
  end
end
}}

���̂悤�ȃR�[�h�ɂȂ��Ă���B���ꂪ�A���ꂼ��v���O�C���ƃA�N�V�����̊�{�`�ƂȂ��Ă���B

{{code
    def plg_hello
      [:strong, \"hello, world!\"]
    end
}}

����method��`�ɂ���āAhello�Ƃ����v���O�C�����`���Ă���B

 {{hello}}
{{hello}}

���̂悤�ɁAQwik::Action�Ƃ����N���X�ɂ����āA���\�b�h���̐擪��
\'\'plg_\'\'�Ƃ��Ă��̂��v���O�C���Ƃ��ċ@�\����B

* ��т��ѕ���

���\�b�h�̒��ɂ͔z�񂪏�����Ă��邾�������A�����HTML������킵�Ă���B
 [:strong, \"hello, world!\"]
���̎w��́A���L��HTML�Ɠ����Ӗ��ł���B
 <strong>hello, world!</strong>

�z��̐擪���V���{���������ꍇ�́A���̃V���{���ɂ��^�O���ł����܂ꂽ
HTML�ł���Ƃ��Ă�������B���̔z��ɂ��HTML�\�L�����͍��ѓN�����l
�������̂ŁA�u��т��ѕ����v�ƌĂ�ł���B

���̕\�L���@�ɂ͂������񗘓_������B
- �I���^�O���L�ڂ���K�v���Ȃ��B
- ��Ɏ����I��sanitize�����Bsanitize�����肵�Ȃ���������C�ɂ���K�v�������B
- �P�Ȃ�z��Ȃ̂ŁA�ォ��ό`������̂��e�ՁB

���_������B
- �x���B

�ŏI�I��XML�Ƃ��Đ�������̂Ɏ኱���Ԃ�������B
���̌��_�������Ȃ����߂ɁA���c���ɂ��C�ɂ��ext������B

�u��т��ѕ����v�Ɋ֘A������e�Ƃ��āA���ю��̓��L���Q�Ƃ��Ă��������B
-[[��т��� HTML �����ŃT�j�^�C�Y���m���� : ����ȓ��L|http://namazu.org/~satoru/diary/20040824.html#p01]]

* �A�N�V����

* act-sample2.rb
# �d�v�Ȃ͍̂ŏ���3��method�ł���B

* �v���O�C��
�܂��͈�ڂ�method�B
    def plg_tt(text)
      [:tt, text]
    end

����́Att�Ƃ����v���O�C�����`���Ă���B

 test {{tt(test)}} test
test {{tt(test)}} test

���̂悤�ɁA�^�񒆂�test���������ŕ\�������B�܂�A�^�񒆂�test�����A
<tt>�Ƃ����^�O�ň͂܂�ĕ\�����Ă���B[:tt,text] �Ƃ����\�L�ɂ���āA
\"<tt>\#{text}</tt>\"�ƕ\�L����̂Ɠ����L�q�����Ă���킯���B���ꂪ�v���O
�C���̍ł���{�I�Ȍ`�ł���B

* �u���b�N���x���E�v���O�C��

��ڂ�method�A�����quote�Ƃ����v���O�C�����`���Ă���B

    def plg_quote
      text = yield
      ar = []
      text.each {|line|
	ar << line
	ar << [:br]
      }
      [:blockquote,
	[:p, {:style=>\"font-size:smaller;\"}, *ar]]
    end

quote�v���O�C���́A����ƈႢ�A�u���b�N���x���E�v���O�C���ł���B

 {{quote
 ��s��
 ��s��
 }}
{{quote
��s��
��s��
}}

���̂悤�ɕ����s�̓��͂��Ƃ�B�ŏ��� text = yield �ŁA�v���O�C���Ɉ͂�
�ꂽ��������擾����B���̌�A��s�Âɕ������A<br/>�����K�ɂ��Ȃ�
��A�ǉ����Ă��邻���čŌ��blockquote�^�O��p�^�O�ň͂�ł���B����
��style���w�肵�Ă���Battribute�͂��̂悤�ɁAHash�Ŏw�肷��B

qwikWeb�ł͂��̂悤�ɁAxml��Array��Hash�Ȃǂ����̏W���Ŏw�肵�Ă���B
����͍��ѓN���ɂ��u��т��ѕ����v�����̂܂܎؂�Ă������̂ł���B

* �A�N�V����

�����܂ł̓�͂�����v���O�C���ł���A�����ɖ��ߍ���Ŏg�����̂���
���B���ɁA�A�N�V�����ɂ��Đ�������B

    def act_hello
      c_ok(\"hello, world\"){\"hi, there.\"}
    end

���ꂪ�A�N�V�����B

 http://127.0.0.1:9190/.hello

����URL�ɃA�N�Z�X����ƁA�Ȃɂ����b�Z�[�W�y�[�W���łĂ���B�^�C�g����
hello, ���b�Z�[�W��hi, there�Ƃł�B���̂悤�Ƀh�b�g�Ŏn�܂�URL�́A
act_hello�Ƃ������\�b�h�̌Ăяo���ɑΉ����Ă���B���\�b�h�̒��Ŏ��s��
�ꂽ���ʂ��A�y�[�W�Ƃ��ĕԂ��Ă���B

����qwikWeb�ł́A�ʏ�̃y�[�W�\����ҏW��ʂ��A�S�Ă��̃A�N�V�����Ƃ�
���d�g�݂ō���Ă���BFrontPage.html�Ƃ���URL�́AFrontPage�Ƃ����y�[
�W�ɑ΂���html�Ƃ����A�N�V���������s����Ƃ����Ӗ��ɂȂ�B�����ŁA
FrontPage�Ƃ����y�[�W���當�����ǂݍ��݁Ahtml�ɕϊ����ďo�͂��Ă���
�Ƃ����킯�ł���B(�{���͂���������ƕ��G�Ȃ񂾂��ǂˁB)
FrontPage.edit�́AFrontPage�̕ҏW��ʂ�\������A�Ƃ����Ӗ��ɂȂ�B
qwikWeb�́A���̂悤�ȃA�N�V�����̘A�������őS�Ă̏������������Ă���B

* �e�X�g�R�[�h

�R�[�h�̌㔼�͉�������Ă��邩�Ƃ����ƁA�e�X�g�R�[�h�ɂȂ��Ă���B

      assert_wiki([:tt, \'t\'], \'{{tt(t)}}\')

�Ⴆ�΂��̃R�[�h�́AWiki�L�@�Ƃ��āo�ott(t)�p�p�Ƃ������ɋL�q����ƁA
���̕����͌��ʓI�ɂ��̂悤��html�ւƕϊ������A�Ƃ������Ƃ��e�X�g����
����B

�A�N�V���������l�Ƀe�X�g���Ă���B

      res = session(\'/test/.hello\')
      ok_title(\'hello, world\')

����́A.hello�Ƃ����A�N�V�����ɃA�N�Z�X���āA�����Ő������ꂽ�y�[�W��
��title�Ƃ����^�O�������Ă���ƁA���̒��g��hello, world�Ƃ����e�L�X�g
�ɂȂ��Ă���A�Ƃ������Ƃ��e�X�g���Ă���Bassert_tag�́A\'title\'�Ƃ���
�^�O��T���Ă��āA���̒��̃e�L�X�g���擾���A��r����Ƃ���assert�Ȃ킯
���B

title�^�O�ł���Ε����ň�����Ȃ����߂��̕����Ŗ��Ȃ����A
�ʏ�̓^�O�͂������񂠂��āA��������܂��w�肷��͓̂���B
�����ŁAXPath���g���ă^�O���w�肷��d�g�݂��p�ӂ��Ă���B

assert_xpath�ł́AXPath���g���Č����������������w�肵�A
���̒��g����т��ѕ�����Array�Ɣ�r����B

���̂悤�Ȏd�g�݂�p�ӂ��邱�Ƃɂ���āA�e�X�g�����������邱�Ƃ�
�������Ă���B

* �����ēǂݍ���

�f�o�b�O���[�h�A-d�I�v�V�����t����qwikWeb���N������ƁA�t�@�C���̎���
�ēǂݍ��݋@�\���I���ɂȂ�B���̏�ԂŔC�ӂ̃R�[�h��ҏW���A�Z�[�u����
�ƁA�����ɂ��̃t�@�C�����ēǂݍ��݂���A���̃R�[�h���L���ƂȂ�B(���m
�ɂ́A��b�Ɉ��`�F�b�N���Ă���B�t�@�C�����X�V����Ă���ǂނƂ�����
������Ă���B)

�Ⴆ�΁Aqwikweb���N�����Ă���Œ��ɁA�����tt�^�O�̂Ƃ�����A�Ⴆ��
b�^�O�ɕς���B��������ƁA�R�}���h���C���ɁAreload�������Ƃ������b�Z�[
�W���\�������B

 reload: \"/cygdrive/c/qwik/lib/qwik/act-sample.rb\"

���ꂩ��u���E�U�Ń����[�h����ƁA����܂ł�tt�^�O�������Ƃ��낪b�^�O
�ɕς���Ă���̂��킩��͂����B

���̂悤�ɃT�[�o���ċN�����Ȃ��Ă��R�[�h�̕ύX�𔽉f��������悤�Ȏd
�g�݂ɂ��Ă���B����ɂ���āA�T�[�o�𓮍삳���Ȃ���v���O�������X�V��
�Ă������Ƃ��ł���B

** �����ō���Ă݂�

�������g�̃v���O�C����A�N�V��������肽���ꍇ�́A�ŏ��͎�����
act-sample.rb�����������Ȃ��烊���[�h���Ă����̂��������낤�B

�����Ȃ�̃t�@�C�����܂Ƃ܂�����Alib/qwik�Ƃ���directory�ɁAact-����
�n�܂�t�@�C��������Ēu���΂悢�BqwikWeb�́A�����I��act-����n�܂�t�@
�C�������[�h����B

Happy Hacking!
'
    }

    Dja_table = {
      :dt => '�e�[�u���ҏW�v���O�C��',
      :dd => '�y�[�W���Ńe�[�u����ҏW�ł��܂��B',
      :dc => "* ��
 {{table}}
{{table}}

������5x5�̃e�[�u���������܂��B
���ꂼ��̍��ڂ͓��̓t�B�[���h�ɂȂ��Ă���A�����������܂��B
�Ō�Ɂu�X�V�v�������ƁA�����̓��͂����f����܂��B

���̉�ʂ͐����p�̉�ʂȂ̂ŁA�ҏW�ł��܂���B
" }

    Dja_sample = {
      :dt => '�T���v���E�v���O�C��',
      :dd => '�v���O�C���̃T���v���ł��B',
      :dc => '
�����ɂ�����Q�l�Ƃ��Ē񋟂��Ă�����̂ł��B

���̃v���O�C���͎������@��m�邽�߂�
�T���v���Ƃ��Ē񋟂��Ă�����̂ł��B���̃v���O�C�������ɁA
�݂Ȃ��܎��R�Ɏ����Ȃ�̃v���O�C��������Ă݂Ă��������B

�ڂ����́A�������URL������񂭂������B
http://qwik.jp/HowToMakePlugin.html

* ��
** �n���[���[���h�E�v���O�C��
{{hello}}
 {{hello}}
�L���ȁuhello, world!�v����ʂɕ\�������邱�Ƃ��ł��܂��B
{{hello(\"qwik users\")}}
 {{hello(\"qwik users\")}}
�������Ƃ邱�Ƃ��ł��܂��B

** �n���[���[���h�E�A�N�V����
[[.hello]]
 [[.hello]]
�uhello, world!�v�ƕ\������܂��B

** �����v���O�C��
{{tt(\"This is a test.\")}}
 {{tt(\"This is a test.\")}}
�������w�肵�܂��B

** ���p�v���O�C��
{{quote
This is a text to quote.
}}
 {{quote
 This is a text to quote.
 }}
���p�ł��܂��B
' }

    Dja_search = {
      :dt => '�����v���O�C��',
      :dd => '�����������܂��B',
      :dc => "* ��
 {{search}}
{{search}}
" }

    Dja_typekey = {
      :dt => 'TypeKey�ɂ�郍�O�C��',
      :dd => 'TypeKey�F�؂Ń��O�C�����邱�Ƃ��ł��܂��B',
      :dc => "* �g����

���O�C����ʂɂāA���[�U���A�p�X���[�h����͂���t�B�[���h�̉���
�uTypeKey�Ń��O�C������v�Ƃ��������N������܂��B
���̃����N�����ǂ�ƁATypeKey�ɂ��F�؉�ʂɂƂт܂��B
���̉�ʂ��烍�O�C�����Ă��������B
���ۂɂ�TypeKey�ł̃A�J�E���g���ł͂Ȃ��A
���[���A�h���X�ɂ���ĔF�؂��邽�߁A
���[���A�h���X��ʒm����K�v������܂��B
�܂��A���̃��[���A�h���X���A���̃O���[�v�ɓo�^����Ă���
���[���A�h���X�ƈ�v���Ă���K�v������܂��B
" }

    Dja_chronology = {
      :dt => '�N�\�@�\ ',
      :dd => "�T�C�g�̃y�[�W�����쐬����A�ҏW����Ă����̂����ꗗ�ł��܂��B",
      :dc => '* �g����
 [[.time_walker]]
[[.time_walker]]

���̃����N�����ǂ�ƔN�\���\�����܂��B
' }

    Dja_wysiwyg = {
      :dt => '�����܂ܕҏW���[�h ',
      :dd => '�y�[�W�������܂܂̏�ԂŕҏW�ł��܂��B',
      :dc => "* ��
���Ƃ��΁A[[edit FrontPage|FrontPage.wysiwyg]]����FrontPage�������܂܂̏�ԂŕҏW�����ʂɂƂт܂��B

���̃y�[�W���猩���܂ܕҏW��ʂɔ�Ԃɂ́A���L�̃v���O�C�����g���܂��B
 {{wysiwyg}}
{{wysiwyg}}
" }

    Dja_textformat_simple = {
      :dt => '�����ꗗ',
      :dd => 'qwikWeb�̏����ꗗ�ȗ��łł��B',
      :dc => '* �����ꗗ
�ڍׂȐ�����[[textformat.describeTextFormat]]������񂭂������B
** ���o��2
*** ���o��3
**** ���o��4
***** ���o��5
- �ӏ������x��1
-- �ӏ������x��2
--- �ӏ������x��3
+ �������X�g1
++ �������X�g2
+++ �������X�g3
 ���`�ς݃e�L�X�g�B
> ���p�B
:Wiki:�������݉\��Web�y�[�W
:QuickML:�ȒP�ɍ��郁�[�����O���X�g�V�X�e��
,����1-1,����1-2,����1-3
,����2-1,����2-2,����2-3
\'\'����\'\'�A\'\'\'����ɋ���\'\'\'�A==��������==
[[new|http://qwik.jp/.theme/new.png]]
[[FrontPage]]
[[Yahoo!|http://www.yahoo.co.jp/]]
{{recent(1)}}

{{{
** ���o��2
*** ���o��3
**** ���o��4
***** ���o��5
- �ӏ������x��1
-- �ӏ������x��2
--- �ӏ������x��3
+ �������X�g1
++ �������X�g2
+++ �������X�g3
 ���`�ς݃e�L�X�g�B
> ���p�B
:Wiki:�������݉\��Web�y�[�W
:QuickML:�ȒP�ɍ��郁�[�����O���X�g�V�X�e��
,����1-1,����1-2,����1-3
,����2-1,����2-2,����2-3
\'\'����\'\'�A\'\'\'����ɋ���\'\'\'�A==��������==
[[new|http://qwik.jp/.theme/new.png]]
[[FrontPage]]
[[Yahoo!|http://www.yahoo.co.jp/]]
{{recent(1)}}
}}}
'
    }

    Dja_textformat = {
      :dt => '�����ꗗ�ڍה�',
      :dd => 'qwikWeb�̏����ꗗ�ł��B',
      :dc => '* �����ꗗ
�ȗ�������������[[textformat_simple.describe]]�������������B
* ���o��
- �u*�v���s�̐擪�ɏ����ƌ��o���ɂȂ�܂��B
- �u*�v��1����5�܂ŋL�q���邱�Ƃ��ł��܂��B
���ꂼ��<H2>�`<H6>�ɕϊ�����܂��B
 * ���o��1
 ** ���o��2
 *** ���o��3
 **** ���o��4
 ***** ���o��5
* ���o��1
** ���o��2
*** ���o��3
**** ���o��4
***** ���o��5
* �y�[�W�^�C�g��
�y�[�W�̈�ԍŏ��̍s�Ɂu*�v����Ō��o���������ƁA���̌��o���̓y�[�W
�^�C�g���Ƃ��ċ@�\���܂��B���̃y�[�W����́A���̃y�[�W�^�C�g�����g����
�����N���邱�Ƃ��ł��܂��B
- [[TextFormat]]�������������B
- [[�����ꗗ�ڍה�]]�������������B
 - [[TextFormat]]�������������B
 - [[�����ꗗ�ڍה�]]�������������B
�Ƃ����悤�ɁA������̃y�[�W�ւ̃����N�ɂ����āA�y�[�WID�ɂ�郊���N
�ƁA�y�[�W�^�C�g���ɂ�郊���N��I�Ԃ��Ƃ��ł��܂��B

�O�҂̃y�[�WID���g���������N�̏ꍇ�A���̃y�[�W�̃y�[�W�^�C�g�����ύX��
�ꂽ�ꍇ�A�����I�ɂ��̃^�C�g�������f����܂��B�������A��҂̃y�[�W�^�C
�g���Ń����N�����ꍇ�A�����N��̃y�[�W�^�C�g�����ύX���ꂽ�ꍇ�A�����N
�؂�ɂȂ��Ă��܂��܂��B���̂��߁A�ʏ�̓y�[�WID��p���������N���@����
���߂��܂��B

* �ӏ�����
- �u-�v���s�̐擪�ɏ����Ɖӏ������ɂȂ�܂��B
- �u-�v�͂P����R�܂ŋL�q���邱�Ƃ��\�œ���q�ɂ��邱�Ƃ��ł��܂��B
- �u+�v���s�̐擪�ɏ����Ɣԍ��t���̉ӏ������ɂȂ�܂��B
 - �ӏ������x��1
 -- �ӏ������x��2
 --- �ӏ������x��3
 + �������X�g1
 ++ �������X�g2
 +++ �������X�g3
- �ӏ������x��1
-- �ӏ������x��2
--- �ӏ������x��3
+ �������X�g1
++ �������X�g2
+++ �������X�g3
* �p���O���t
- �A�����������s�͘A�������1�̃p���O���t�ɂȂ�܂��B
- ��s(���s�̂݁A�܂��̓X�y�[�X�A�^�u�����̍s)�̓p���O���t�̋�؂�ɂȂ�܂��B
 �Ⴆ�΁A
 �����������ɋL�q����ƁA�����̍s��
 1�̃p���O���t�Ƃ��Đ��`����܂��B
�Ⴆ�΁A
�����������ɋL�q����ƁA�����̍s��
1�̃p���O���t�Ƃ��Đ��`����܂��B
* ������
- �u=�v���s�̐擪����4�����Ɛ�����(��؂��)�ɂȂ�܂��B
 ���̕��͂ƁA
 ====
 ���̕��͂́A��؂��Ă��܂��B
���̕��͂ƁA
====
���̕��͂́A��؂��Ă��܂��B
* ���`�ς݃e�L�X�g
- �s�̐擪���X�y�[�X�܂��̓^�u�Ŏn�܂��Ă���ƁA���̍s�͐��`�ς݂Ƃ��Ĉ����܂��B
 ����́A
 ���`�ς�
 �e�L�X�g�ł��B
��ʂ̐��`�ς݃e�L�X�g��\���������ꍇ�́u{{{�v�Ɓu}}}�v�ň݂͂܂��B����Ȋ����ł��B
{{{
void main()
{
    printf(\"hello, world\\n\");
}
}}}
* ���p
�u>�v���s�̐擪���珑���ƈ��p�ɂȂ�܂��B
 > ����͈��p�ł��B
> ����͈��p�ł��B
* �p����
�R�����u:�v���s�̐擪�ɏ����A�����ėp��:������Ƃ���Ɨp�����ɂȂ�܂��B
 :Wiki:�������݉\��Web�y�[�W
 :QuickML:�ȒP�ɍ��郁�[�����O���X�g�V�X�e��
:Wiki:�������݉\��Web�y�[�W
:QuickML:�ȒP�ɍ��郁�[�����O���X�g�V�X�e��
* �\
�\(�e�[�u��)�́u,�v�܂��́u|�v�Ŏn�߁A�R�������ɂ��̋L���ŋ�؂�܂��B
 ,����1-1,����1-2,����1-3
 ,����2-1,����2-2,����2-3
,����1-1,����1-2,����1-3
,����2-1,����2-2,����2-3
* �����v�f�̎w��
���͒��̈ꕔ���̕����v�f��ω������܂��B
- �u\'�v2�ł͂��񂾕����͋�������܂��B
- �u\'�v3�ł͂��񂾕����͂���ɋ�������܂��B
- �u=�v2�ł͂��񂾕����͎�����ɂȂ�܂��B
 ���̂悤�ɂ����\'\'����\'\'�ɂȂ�܂��B
 �����āA���̂悤�ɂ����\'\'\'����ɋ���\'\'\'����܂��B
 ==�Ȃ�ƂȂ�==�����������T�|�[�g���Ă��܂��B
���̂悤�ɂ����\'\'����\'\'�ɂȂ�܂��B
�����āA���̂悤�ɂ����\'\'\'����ɋ���\'\'\'����܂��B
==�Ȃ�ƂȂ�==�����������T�|�[�g���Ă��܂��B
* �����N
- �����N�������y�[�W�����Q�̃J�M�J�b�R�ň͂ނƁA���̃y�[�W�ւ̃����N�ɂȂ�܂��B
 �Ⴆ��[[FrontPage]]�Ƃ���ƁA�����y�[�W�ւ̃����N�ɂȂ�܂��B
�Ⴆ��[[FrontPage]]�Ƃ���ƁA�����y�[�W�ւ̃����N�ɂȂ�܂��B
* �V�K�y�[�W�̍쐬
�u�V�K�쐬�v�����ǂ�ƁA�y�[�W���쐬�ł��܂��B
* �y�[�W�̍폜
�e�L�X�g��S���������ĕۑ�����ƁA���̃y�[�W���폜���܂��B
* �C�ӂ�URL�ւ̃����N
�P��|URL���Q�̃J�M�J�b�R�ň͂ނƂ�C�ӂ�URL�ւ̃����N�ɂȂ�܂��B
 [[qwik|http://qwik.jp/]]�Ƃ����ł��܂��B
[[qwik|http://qwik.jp/]]�Ƃ����ł��܂��B

���̂Ƃ�URL�̖�����jpg,jpeg,png,gif���ƁA�摜���y�[�W���ɖ��ߍ��܂�܂��B
(�w�肵���P�ꂪALT�v�f�ɐݒ肳��܂��B)
 [[New!|http://img.yahoo.co.jp/images/new2.gif]]
[[New!|http://img.yahoo.co.jp/images/new2.gif]]

�p���O���t����URL�̂悤�Ȃ��̂�����ƁA�����I�Ƀ����N�ƂȂ�܂��B
 qwikWeb�̃z�[���y�[�W��http://qwik.jp/�ł��B
qwikWeb�̃z�[���y�[�W��http://qwik.jp/�ł��B

* InterWiki
InterWiki�Ƃ́A����Wiki�y�[�W�֊ȒP�Ƀ����N���͂�@�\�ł��B
�܂����̊g���Ƃ��āAGoogle��Amazon�ȂǂɊȒP�Ƀ����N���͂�@�\���񋟂��܂��B
 - [[google:qwikWeb]]
 - [[isbn:4797318325]]
 - [[amazon:Wiki]]
- [[google:qwikWeb]]
- [[isbn:4797318325]]
- [[amazon:Wiki]]
'
    }

    Dja_theme_list = {
      :dt => '�e�[�}�ꗗ',
      :dd => '�I���\�ȃe�[�}�ꗗ���\������܂��B',
      :dc => '* ��
 {{theme_list}}
{{theme_list}}
�I���\�ȃe�[�}�ꗗ�ł��B

[[_SiteConfig]]�y�[�W�ɂāA�e�[�}��ݒ�ł��܂��B
' }

    Dja_wema = {
      :dt => '��ⳋ@�\ ',
      :dd => '��Ⳃ��͂邱�Ƃ��ł��܂��B',
      :dc => '* �g�p�@
�y�[�W�̉��ɁA�uNew Post-it�v�Ƃ��������N������̂ŁA�����Ă��������B
������Window���\�����܂��B�Ȃɂ��e�L�X�g������A�Z�[�u���Ă��������B
Window�𓮂����āA�uset�v�������ƈʒu���Z�b�g���܂��B
' }

  end
end
