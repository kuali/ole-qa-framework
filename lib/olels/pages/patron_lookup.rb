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

module OLE_QA::Framework::OLELS
  # The Patron lookup page in the OLE Library System.
  class Patron_Lookup < Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Patron&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OlePatronDocument&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    # Set Patron Lookup elements.
    def set_elements
      super
      element(:patron_id_field)                 {b.text_field(:id => "olePatronId_control")}
      element(:barcode_field)                   {b.text_field(:id => "barcode_control")}
      element(:first_name_field)                {b.text_field(:id => "firstName_control")}
      element(:last_name_field)                 {b.text_field(:id => "lastName_control")}
      element(:borrower_type_selector)          {b.select_list(:id => "borrowerType_control")}
      element(:email_address_field)             {b.text_field(:id => "emailAddress_control")}
      # Search Controls
      # TODO Move these elements to OLE_QA::Framework::OLELS::Lookup (common) when they become universal.
      element(:active_yes_button)               {b.radio(:id => 'activeIndicator_control_0')}
      element(:active_no_button)                {b.radio(:id => 'activeIndicator_control_1')}
      element(:active_both_button)              {b.radio(:id => 'activeIndicator_control_2')}
      element(:search_button)                   {b.button(:text => "Search")}
      element(:clear_button)                    {b.button(:text => "Clear Values")}
      element(:cancel_button)                   {b.button(:text => "Cancel")}
    end

    def set_functions
      super
      # Return the span containing the given text, if it appears in the search results.
      function(:text_in_results)                {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]")}
      # Return whether the given text exists in the search results.
      function(:text_in_results?)                {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]").present? }
      # Function used for edit_by_text, copy_by_text, and delete_by_text.
      function(:edit_by_text)                    {|which| b.a(:xpath => link_by_text('edit',which)) }
      # Return the copy link for a given text string in the search results.
      function(:copy_by_text)                    {|which| b.a(:xpath => link_by_text('copy',which)) }
      # Return the delete link for a given text string in the search results.
      function(:delete_by_text)                  {|which| b.a(:xpath => link_by_text('delete',which)) }
    end

    # Return the XPath to find a link with the given text on a line containing a search result with the given text.
    # @param [String] link    The text of the link to be returned.  ('edit','copy', or 'delete')
    # @param [String] text    The text to locate in the search results.  (e.g., a patron's first name, barcode, ID, etc.)
    def link_by_text(link,text)
      "//tr/td[div/span[contains(text(),'#{text}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'#{link}')]" 
    end
    private :link_by_text

  end
end
