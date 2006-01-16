#
# Copyright (C) 2003-2005 Kouichirou Eto
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#

$LOAD_PATH << '../../lib' unless $LOAD_PATH.include?('../../lib')
require 'qwik/tokenizer'
require 'qwik/parser'
require 'qwik/parser-emode'

module Qwik
  class Page
    def get_md5
      @md5_str = nil if ! defined?(@md5_str)
      @md5 = nil     if ! defined?(@md5)
      str = self.get
      return @md5 if str == @md5_str
      return @md5 = (@md5_str = str).md5hex
    end

    def get_tokens
      @tokens_str = nil if ! defined?(@tokens_str)
      @tokens = nil     if ! defined?(@tokens)

      str = self.get
      return @tokens if str == @tokens_str
      @tokens_str = str
      @tokens = TextTokenizer.tokenize(str)
      return @tokens
    end

    def get_tree
      @tree_str = nil if ! defined?(@tree_str)
      @tree = nil     if ! defined?(@tree)

      str = self.get
      return @tree if str == @tree_str
      @tree_str = str
      if EmodePreProcessor.emode?(str)
	str = EmodePreProcessor.preprocess(str)
      end
      tokens = TextTokenizer.tokenize(str)
      @tree = TextParser.make_tree(tokens)
      return @tree
    end

    def get_body_tree
      @body_tree_str = nil if ! defined?(@body_tree_str)
      @body_tree = nil     if ! defined?(@body_tree)

      str = self.get_body
      return @body_tree if str == @body_tree_str
      @body_tree_str = str
      if EmodePreProcessor.emode?(str)
	str = EmodePreProcessor.preprocess(str)
      end
      tokens = TextTokenizer.tokenize(str)
      @body_tree = TextParser.make_tree(tokens)
      return @body_tree
    end
  end
end
