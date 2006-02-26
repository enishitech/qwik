$LOAD_PATH << '..' unless $LOAD_PATH.include? '..'

module Qwik
  class Action
    D_plugin_calc = {
      :dt => 'Calicurator plugin',
      :dd => 'You can sum numbers by simple table.',
      :dc => "* Example
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

    Dja_plugin_calc = {
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

    def plg_calc
      str = yield

      tokens = TextTokenizer.tokenize(str)

      table = []
      sum = []

      used_prefix = []
      used_suffix = []

      tokens.each {|token|
	case token[0]
	when :table
	  col = []
	  token[1..-1].each_with_index {|t, i|
	    prefix, n, suffix = calc_parse_num(t)
	    col << t
	    if n
	      sum[i] ||= 0
	      if sum[i] != :NaN
		sum[i] += n
	      end

	      if prefix
		if used_prefix[i].nil?
		  used_prefix[i] = prefix
		end
	      end

	      if suffix
		if used_suffix[i].nil?
		  used_suffix[i] = suffix
		end
	      end

	    else
	      sum[i] = :NaN
	    end
	  }
	  table << col
	else
	  return 'you can use only tables in calc plugin'
	end
      }

      if 0 < sum.length
	sum_str = []
	sum.each_with_index {|s, i|
	  if s == :NaN
	    sum_str << ''
	  else
	    sum_str << [used_prefix[i], s.to_s, used_suffix[i]].join
	  end
	}
	tokens << [:table, *sum_str]
      end

      tree = TextParser.make_tree(tokens)

      table = tree[0]
      last_tr = table.last
      last_tr.insert(1, {:class=>'sum'})

      return tree
    end

    CALC_INT_RE   = /\A[0-9,]+\z/
    CALC_FLOAT_RE = /\A[0-9,.]+\z/

    def calc_parse_num(str)
      return [nil, 0, nil] if str.empty?
      return [nil, nil, nil] if /\A[^0-9]+\z/ =~ str	# no number

      prefix = suffix = nil

      if /\A([^-0-9]+)[0-9]/ =~ str
	prefix = $1
	str = str.sub($1, '')
      end

      if /[0-9]([^0-9]+)\z/ =~ str
	suffix = $1
	str = str.sub($1, '')
      end

      i = str.to_i
      f = str.to_f
      n = (f-i) == 0 ? i : f
      return [prefix, n, suffix]
    end
  end
end

if $0 == __FILE__
  require 'qwik/test-common'
  $test = true
end

if defined?($test) && $test
  class TestActCalc < Test::Unit::TestCase
    include TestSession

    def ok(e, str)
      ok_wi(e, str)
    end

    def test_all
      res = session

      # test calc_parse_num
      ok_eq([nil, 0,   nil], @action.calc_parse_num(''))
      ok_eq([nil, nil, nil], @action.calc_parse_num('a'))
      ok_eq([nil, 1,   nil], @action.calc_parse_num('1'))
      ok_eq([nil, 1.5, nil], @action.calc_parse_num('1.5'))
      ok_eq([nil, 1,  'MB'], @action.calc_parse_num('1MB'))
      ok_eq([nil, 1.5,'MB'], @action.calc_parse_num('1.5MB'))
      ok_eq(['$', 1,   nil], @action.calc_parse_num('$1'))
      ok_eq(['$', 1.5, nil], @action.calc_parse_num('$1.5'))

      # test plg_calc
      ok_wi([:table, [:tr, [:td, '0']], [:tr, {:class=>'sum'}, [:td, '0']]],
	    '{{calc
,0
}}')
      ok_wi([:table, [:tr, [:td, '1']], [:tr, [:td, '2']],
	      [:tr, {:class=>'sum'}, [:td, '3']]], '{{calc
,1
,2
}}')
      ok_wi([:table,
	      [:tr, [:td, '1'], [:td, '3.4']],
	      [:tr, [:td, '2'], [:td, '5.6']],
	      [:tr, {:class=>'sum'}, [:td, '3'], [:td, '9.0']]],
	    '{{calc
,1,3.4
,2,5.6
}}')
      ok_wi([:table, [:tr, [:td, 'a'], [:td, '0']],
	      [:tr, {:class=>'sum'}, [:td, ''], [:td, '0']]],
	    '{{calc
,a,0
}}')
      ok_wi([:table, [:tr, [:td, '1MB']], [:tr, {:class=>'sum'}, [:td, '1MB']]],
	    '{{calc
,1MB
}}')
      ok_wi([:table, [:tr, [:td, '$1']], [:tr, {:class=>'sum'}, [:td, '$1']]],
	    '{{calc
,$1
}}')
      ok_wi([:table, [:tr, [:td, '$1']], [:tr, {:class=>'sum'}, [:td, '$1']]],
	    '{{calc
,$1,
}}' )
      ok_wi([:table,
	      [:tr, [:td, "$100\t"], [:td, 'CPU']],
	      [:tr, [:td, "$100\t"], [:td, 'Memory']],
	      [:tr, [:td, "$20.5\t"], [:td, 'Cable']],
	      [:tr, [:td, "$250\t"], [:td, 'Graphic Card']],
	      [:tr, [:td, "$250\t"], [:td, 'HDD']],
	      [:tr, [:td, "$400\t"], [:td, 'Mother Board']],
	      [:tr, {:class=>'sum'}, [:td, "$1120.5\t"], [:td, '']]],
	    '{{calc
,$100	,CPU
,$100	,Memory
,$20.5	,Cable
,$250	,Graphic Card
,$250	,HDD
,$400	,Mother Board
}}')
      ok_wi([:table,
	      [:tr, [:td, '1��'], [:td, "\tCPU"]],
	      [:tr, [:td, '1��'], [:td, "\tMemory"]],
	      [:tr, [:td, '0.2��'], [:td, "\tAdapter"]],
	      [:tr, [:td, '2.5��'], [:td, "\tnVidia"]],
	      [:tr, [:td, '2.5��'], [:td, "\tHDD 250GB"]],
	      [:tr, [:td, '4��'], [:td, "\tNAS"]],
	      [:tr, [:td, '22��'], [:td, "\tThinkPad X40"]],
	      [:tr, {:class=>'sum'}, [:td, '33.2��'], [:td, '']]],
	 '{{calc
,1��,	CPU
,1��,	Memory
,0.2��,	Adapter
,2.5��,	nVidia
,2.5��,	HDD 250GB
,4��,	NAS
,22��,	ThinkPad X40
}}')
      ok_wi([:table,
	      [:tr, [:td, "a\t"], [:td, '10,000']],
	      [:tr, [:td, "b\t"], [:td, '20,000']],
	      [:tr, {:class=>'sum'}, [:td, ''], [:td, '30']]],
	    '{{calc
|a	|10,000
|b	|20,000
}}')
      # Don't work.
      ok_wi([:table,
	      [:tr, [:td, "���i\t"], [:td, '�l�i']],
	      [:tr, [:td, "a\t"], [:td, "\\10,000"]],
	      [:tr, [:td, "b\t"], [:td, "\\20,000"]],
	      [:tr, {:class=>'sum'}, [:td, ''], [:td, '']]],
	    '{{calc
|���i	|�l�i
|a	|\\10,000
|b	|\\20,000
}}')
    end
  end
end
