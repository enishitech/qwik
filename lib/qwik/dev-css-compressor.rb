$LOAD_PATH << '../../lib' unless $LOAD_PATH.include?('../../lib')
require 'qwik/util-pathname'

class CSSCompressor
  def self.run
    generate_src
  end

  def self.generate_src
    src = <<'EOT'
/* Copyright (C) 2003-2005 Kouichirou Eto, All rights reserved.
   This is free software with ABSOLUTELY NO WARRANTY.
   You can redistribute it and/or modify it under the terms of the GNU GPL2. */
/* AUTOMATICALLY GENERATED.  DO NOT EDIT. */

EOT
    '.'.path.each_entry {|file|
      f = file.to_s
      next unless /\.css\z/ =~ f
      s = ''
      file.open {|f|
	while line = f.gets
	  line.sub!(/\/\/.+$/, '')
	  line.sub!(/\A\s+/, '')
	  line.sub!(/\A([-\w]+:)\s+/) { $1 }
	  case line
	  when /\A\/\//, /\A\s*$/
	    # do nothing
	  when /\A\/\*.+\*\/$/
	    # do nothing
	  else
	    s << line
	  end
	end
	f.read
      }
      src << s
    }

    '../all.css'.path.open('wb') {|f|
      f.puts src
    }
  end
end

if $0 == __FILE__
  CSSCompressor.run
end
