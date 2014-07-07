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

    # Eigenclass setup to lock different instances to the same Headless session.
    class << self
      # Return the current Headless session.
      attr_accessor :headless_session

      # Is Headless started?
      def is_headless?
        @is_headless
      end

      # Start a new Headless session.
      def start_headless
        @headless_session ||= Headless.new
        unless self.is_headless? then
          @is_headless      = true
          @headless_session.start
        end
      end

      # Stop the headless session.
      def stop_headless
        if self.is_headless? then
          @headless_session.stop
          @is_headless = false
        else
          raise OLE_QA::Framework::Error,"Headless is not running."
        end
      end

      # Quit the headless session entirely.
      def quit_headless
        @headless_session.destroy if self.is_headless?
      end
    end

    @headless_session = nil
    @is_headless      = false

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
    #   :profile => profile
    #     (Where profile is a Selenium::WebDriver::Firefox::Profile instance)
    #
    # To configure the default options, edit
    #   config/options.yml
    #
    def initialize( options={} )
      options_defaults = YAML.load_file(OLE_QA::Framework::load_dir + '/../config/options.yml')
      @options = options_defaults.merge(options)

      # Set local variable if @options[:browser] is given a Watir::Browser session.
      browser_given = @options.has_key?(:browser) && @options[:browser].is_a?(Watir::Browser)

      # Use Headless if requested.
      if @options[:headless?] && ! browser_given
        self.class.start_headless
      else
        self.class.stop_headless if self.is_headless?
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
      if browser_given
        @browser = @options[:browser]
      else
        # Use a Firefox profile, if given.
        @options.has_key?(:profile) ?
            @browser = Watir::Browser.new(:firefox, :profile => @options[:profile]) :
            @browser = Watir::Browser.new(:firefox)
        @browser.driver.manage.timeouts.implicit_wait = @options[:implicit_wait]
      end

      # Set cutomizable default timeout on Watir-Webdriver (v0.6.5+).
      Watir.default_timeout = @explicit_wait
    end

    # Access the Headless session class-level instance variable.
    def headless_session
      self.class.headless_session
    end

    # Return whether Headless is running.
    def is_headless?
      self.class.is_headless?
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

    # Exit the browser only, stop the Headless (XVFB) session, but don't destroy it entirely.
    def close
      @browser.quit
    end

    # Teardown the OLE QA Framework.
    # - Exit the Selenium WebDriver browser session.
    # - Exit the Headless (XVFB) session if necessary.
    def quit
      @browser.quit
      if self.is_headless? then
        self.class.quit_headless
      end
    end
  end
end