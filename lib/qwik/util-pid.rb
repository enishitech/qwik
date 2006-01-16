#
# Copyright (C) 2003-2005 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '../../lib' unless $LOAD_PATH.include?('../../lib')
require 'qwik/util-pathname'

module PidModule
  def write_pid_file(pidfile)
    pidfile.path.put("#{Process.pid}\n")
  end

  def read_pid_file(pidfile)
    pid = nil
    pid = pidfile.path.get_first.chomp.to_i
    return pid
  end

  def remove_pid_file(pidfile)
    if Process.pid == read_pid_file(pidfile)
      pidfile.path.unlink
    end
  end

  # for test
  def exist_pid_file?(pidfile)
    return pidfile.path.exist?
  end
end

if $0 == __FILE__
  require 'qwik/testunit'
  $test = true
end

if defined?($test) && $test
  class TestUtilPid < Test::Unit::TestCase
    include PidModule

    def test_all
      f = 'test-pid.txt'

      # test_exist_pid_file?
      ok_eq(false, exist_pid_file?(f))

      # test_write_pid_file
      write_pid_file(f)
      ok_eq(true, exist_pid_file?(f))

      # test_read_pid_file
      ok_eq(Process.pid, read_pid_file(f))
      
      # test_remove_pid_file
      remove_pid_file(f)
      ok_eq(false, exist_pid_file?(f))
    end
  end
end
