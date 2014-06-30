#!/usr/bin/env ruby

#  Copyright 2005-2014 The Kuali Foundation
#
#  Licensed under the Educational Community License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at:
#
#    http://www.opensource.org/licenses/ecl2.php
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

module OLE_QA
  module Framework
    # Load open-uri for DocStore Page Parsing
    require 'open-uri'
    require 'yaml'
    require 'headless'
    require 'watir-webdriver'

    # Add absolute directory to $LOAD_PATH
    @libdir = File.expand_path(File.dirname(__FILE__))
    $LOAD_PATH.unshift(@libdir) unless $LOAD_PATH.include?(@libdir)

    # Add data directory to $LOAD_PATH
    @datadir = File.expand_path(File.dirname(__FILE__) + "/../data/")
    $LOAD_PATH.unshift(@datadir) unless $LOAD_PATH.include?(@datadir)


    class << self
      # Return absolute path from which the file was run
      def load_dir
        @libdir
      end

      # Return absolute path for data directory
      def data_dir
        @datadir
      end
    end

    # Load libraries from absolute path
    def self.load_libs(filedir, filename = "*.rb")
      Dir[@libdir + filedir + filename].sort.each do |file|
        require file
      end
    end

    # Load main class libraries
    load_libs("/ole_qa_framework/")

    # Load all independent modules
    load_libs("/module/")

    # Load data factories
    load_libs("/data_factory/")

    # Load Page & Element Definitions.
    # Main directory is loaded first, then subdirectories in alphabetical order.
    # If pages or elements need to be inherited by subclasses, put them in a (foo)/common/ directory.
    # Subobject directories (foo)/subobjects/ should be loaded before object directories (foo)/objects/ for inheritance.
    load_libs("/common/")
    load_libs("/docstore/common/")
    load_libs("/olefs/common/")
    load_libs("/olels/common/")
    load_libs("/olefs/subobjects/")
    load_libs("/olels/subobjects/")
    load_libs("/olefs/objects/")
    load_libs("/olels/objects/")
    load_libs("/docstore/pages/")
    load_libs("/olefs/pages/")
    load_libs("/olels/pages/")



    # Initialize wait variables to 0 for now.  They will be set programatically in {OLE_QA::Framework::Session}.
    @explicit_wait = 0
    @doc_wait = 0

    # Set accessor methods for explicit_wait & doc_wait.
    class << self
      attr_reader :explicit_wait, :doc_wait
    end

    # Define OLE_QA::Framework::Error.
    class Error < StandardError
    end
  end
end
