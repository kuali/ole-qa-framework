#  Copyright 2005-2013 The Kuali Foundation
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

  # An OLE Page object
  class Page < Common_Object

    # The URL to open a given page.
    # @note Do not use this value for the URL to open a new page of a given
    #   document type.  If the page object represents an e-Document in OLEFS
    #   or OLELS, instead use the :new_url accessor set on the e-Doc object.
    attr_reader :url

    # An array containing the name (Symbol) of each line object on the page object.
    attr_reader :lines

    include OLE_QA::Framework::Page_Helpers

    # @param ole_session [Object] The OLE_QA::Framework::Session instance in which the page should load.
    # @param url [String] The URL (if any) used to open the page.  (Set to "" if unused.)
    # @param lookup_url [String] The URL (if any) by which a document represented by the page can be opened.
    #   - The string must contain the replacement token '_DOC_ID_' where a document ID is to be inserted.
    def initialize(ole_session, url, lookup_url = nil)
      super(ole_session)
      @url = url
      @lookup_url = lookup_url
      @wait_on = Array.new
      @lines = Array.new
      wait_for_elements if defined?(self.wait_for_elements)
      set_lines if defined?(self.set_lines)
    end

    # Open the page via URL.
    # @note Some pages may not have custom open URLs.  If this is the case,
    #   this method can be passed a lookup URL with a document ID #.
    # @note This method will invoke the wait_for_elements method if it is defined on a page.
    # @note If a page has declared elements to wait on, invoking this method will return
    #   an array of the symbols used to call those methods.
    def open(url = @url)
      @browser.goto(url)
      wait_for_page_to_load
    end

    # Return the URL used to open a specific document by given document number.
    def lookup_url(doc_id)
      @lookup_url.nil? ? nil : (@ole.url + @lookup_url.gsub('_DOC_ID_', doc_id.to_s))
    end

    # Open the page by lookup URL and return true if successful, false if not.
    def lookup(doc_id)
      if !@lookup_url.nil?
        @browser.goto(lookup_url(doc_id))
        true
      else
        false
      end
    end

    # Define this method on a subclass.  Add element symbols to the @wait_on array.
    # This will require the open method to wait for each of these elements to be present before it finishes.
    #   e.g.
    #   def wait_for_elements
    #     @wait_on << :title
    #     @wait_on << :close_button
    #     super
    #   end
    #
    def wait_for_elements
    end

    # Use this method on subclasses to define elements that must be loaded for the page to be considered completely loaded.
    # This method can be called individually or will be called on an open command if .wait_for_elements is defined on the subclass.
    def wait_for_element(element)
      self.send(element).wait_until_present(@ole.explicit_wait)
    end

    # Call this method on a page that has wait_for_elements defined
    # to wait for all required elements on that page to load.
    def wait_for_page_to_load
      @wait_on.each { |element| wait_for_element(element) }
      loading_message.wait_while_present if loading_message.present?
      true
    rescue Watir::Wait::TimeoutError
      false
    end

    # Set screen elements common to most or all pages across the OLE interface.
    def set_elements
      # These elements exist outside of any frame, so @browser is used to force
      #   Watir-Webdriver to give access to a bare browser even on a page with a frame.
      #   See {OLE_QA::Framework::Helpers#browser} for frame handling.
      element(:login_field)           {@browser.text_field(:name => 'backdoorId')}
      element(:login_button)          {@browser.input(:class => 'go', :value => 'Login')}
      element(:logout_button)         {@browser.input(:class => 'go', :value => 'Logout')}
      element(:login_confirmation)    {@browser.div(:id => 'login-info').strong(:text => /Impersonating User\:/)}
      element(:loading_message)       {@browser.img(:alt => 'Loading...')}
    end

    # Set functions common to most or all pages across the OLE interface.
    def set_functions
      # Login as a given user.
      # @param username [String] The username to use.
      # @return [Boolean] Whether the login process succeeded.
      function(:login)                {|as_who = 'ole-khuntley'| raise OLE_QA::Framework::Error,"Login field not present on this page: #{self.class.name}" unless login_field.present? ; login_field.set(as_who) ; login_button.click ; if login_confirmation.present? then login_confirmation.text.match(/#{as_who}/) ? true : false else false end}
      # Logout from previous login.
      # @return [Boolean] Whether the logout process succeeded.
      function(:logout)               { logout_button.click ; login_confirmation.present? ? false : true}
    end
  end
end