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

module OLE_QA::Framework::OLELS
  # The request lookup screen in the OLE Library System.
  class Request_Lookup < OLE_QA::Framework::OLELS::Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Request&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OleDeliverRequestBo&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session,url)
    end

    def set_elements
      super
      element(:patron_barcode_field)              {b.text_field(:id => 'olePatronBarcode_control')}
      element(:patron_barcode_icon)               {b.fieldset(:id => 'olePatronBarcode_fieldset').input(:class => 'uif-actionImage')}
      element(:patron_first_name_field)           {b.text_field(:id => 'olePatronFName_control')}
      element(:patron_last_name_field)            {b.text_field(:id => 'olePatronLName_control')}
      element(:item_barcode_field)                {b.text_field(:id => 'itemId_control')}
      element(:item_barcode_icon)                 {b.fieldset(:id => 'itemId_fieldset').input(:class => 'uif-actionImage')}
      element(:item_title_field)                  {b.text_field(:id => 'title_control')}
      element(:search_button)                     {b.button(:id => 'searchReqBtn')}
      element(:clear_button)                      {b.button(:id => 'clearReqBtn')}
      element(:cancel_button)                     {b.button(:id => 'cancelReqBtn')}
      element(:message)                           {b.li(:class => 'uif-infoMessageItem')}
    end

    def wait_for_elements
      super
      @wait_on << :patron_barcode_field << :patron_first_name_field << :patron_last_name_field
      @wait_on << :item_barcode_field << :item_title_field
    end

    def set_functions
      super
      # Return the span element containing the given text, if it exists in the search results.
      function(:text_in_results)                {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]")}
      # Return whether the given text is found in the search results.
      function(:text_in_results?)               {|which| text_in_results(which).present?}
      # Return the cancel request link for a line containing the given text in the search results.
      function(:cancel_by_text)                 {|which| b.a(:xpath => "//tr/td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'cancel')]")}
      # Return the edit request link for a line containing the given text in the search results.
      function(:edit_by_text)                   {|which| b.a(:xpath => "//tr/td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'edit')]")}
      # Return the text of the Queue Position entry for a line containing the given text.
      function(:position_by_text)               {|which| b.span(:xpath => "//tr/td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/span[starts-with(@id,'result-borrowerQueuePosition_line')]").text}
    end
  end
end