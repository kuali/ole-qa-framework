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

module OLE_QA::Framework

  # Handle Browser Functions, Headless Session
  #   Invoke with @ole = Session.new(opts)
  #   Exit with @ole.quit
  #
  # Default options loaded from
  #   config/options.yml
  #
  class Session

    # OLE Installation Base URL
    #   (e.g. http://ole.your-site.edu/)
    attr_reader :url
    # @deprecated Included for backwards compatibility.  Unnecessary after 1.0.0 unification (milestone m2-r13245).
    alias :fs_url   :url
    alias :base_url :url
    alias :ls_url   :url

    # OLE Document Store Installation Base URL
    #   (e.g. http://docstore.ole.your-site.edu/)
    attr_reader :docstore_url
    alias :docstore :docstore_url

    # Wait period (in seconds) used by OLE QAF Web Element functions
    attr_accessor :explicit_wait

    # The options with which this OLE_QA Framework Session was invoked
    attr_reader :options

    # Options hash keys:
    #   :url => "http://tst.ole.kuali.org/"
    #     (URL for OLE Installation)
    #   :docstore_url => 'http://tst.docstore.ole.kuali.org/'
    #     (URL for OLE DocStore Installation)
    #   :headless? => true/false
    #     (Use Headless gem to handle XVFB session)
    #   :implicit_wait => NN
    #     (Set Selenium Webdriver's default wait period)
    #   :explicit_wait => NN
    #     (Set the wait period used by Watir Webdriver and custom functions)
    #   :doc_wait => NN
    #     (Set the wait period for eDoc routing to complete)
    #   :browser => watir_webdriver
    #     (Where browser is a Watir WebDriver session)
    #
    # To configure the default options, edit
    #   config/options.yml
    #
    def initialize( options={} )
      options_defaults = YAML.load_file(OLE_QA::Framework::load_dir + '/../config/options.yml')
      @options = options_defaults.merge(options)

      # Start headless session if requested
      if @options[:headless?]
        @headless = Headless.new
        @headless.start
      end

      # Set trailing slash on URLs for consistency if not set.
      add_slash = ->(which) { which =~ /\/$/ ? which : which + '/' }

      # Globalize options to accessors
      @url            = add_slash.call(@options[:url])
      @docstore_url   = add_slash.call(@options[:docstore_url])
      @explicit_wait  = @options[:explicit_wait]
      @doc_wait       = @options[:doc_wait]

      # Pass explicit_wait to a module accessor for use with OLE_QA::Tools
      OLE_QA::Framework.instance_variable_set(:@explicit_wait,@options[:explicit_wait])

      # Pass doc_wait to a module accessor for use with OLE_QA::Tools
      OLE_QA::Framework.instance_variable_set(:@doc_wait,@options[:doc_wait])

      # Browser Start
      if @options.has_key?(:browser) && @options[:browser].class == Watir::Browser
        @browser = @options[:browser]
      else
        @browser = Watir::Browser.new :firefox
        @browser.driver.manage.timeouts.implicit_wait = @options[:implicit_wait]
      end

      # Set cutomizable default timeout on Watir-Webdriver (v0.6.5+).
      Watir.default_timeout = @explicit_wait
    end

    # Access Watir-Webdriver's browser session.
    def browser
      @browser
    end

    # Access Watir-Webdriver's Window Handling Method
    def windows
      @browser.windows
    end

    # Open a page via URL.  (Defaults to @base_url.)
    def open(url = @url)
      @browser.goto(url)
    end

    # Teardown the OLE QA Framework.
    # - Exit the Selenium WebDriver browser session.
    # - Exit the Headless (XVFB) session if necessary.
    def quit
      @browser.quit
      if @options[:headless?] then
        @headless.destroy
      end
    end
  end
end