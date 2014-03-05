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
  # The Item Lookup page in the OLE Library System.
  class Item_Lookup < OLE_QA::Framework::Page
    def initialize(ole_session)
      # Direct linking for a new request is not possible, so the URL is for Request_Lookup.
      url = ole_session.url + 'portal.do?channelTitle=Request&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OleDeliverRequestBo&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session,url)
    end

    def set_elements
      super
      element(:title)                         {b.span(:class => 'uif-headerText-span')}
      element(:title_field)                   {b.text_field(:name => 'lookupCriteria[title]')}
      element(:author_field)                  {b.text_field(:name => 'lookupCriteria[author]')}
      element(:publisher_field)               {b.text_field(:name => 'lookupCriteria[publisher]')}
      element(:barcode_field)                 {b.text_field(:name => 'lookupCriteria[itemBarCode]')}
      element(:call_number_field)             {b.text_field(:name => 'lookupCriteria[callNumber]')}
      element(:item_type_selector)            {b.select_list(:name => 'lookupCriteria[itemType]')}
      element(:search_button)                 {b.button(:text => /[Ss]earch/)}
      element(:clear_button)                  {b.button(:text => /[Cc]lear [Vv]alues/)}
      element(:close_button)                  {b.button(:text => /[Cc]lose/)}
      element(:error_message)                 {b.li(:class => 'uif-errorMessageItem')}
    end

    def set_functions
      super
      # Determine if the given text exists in the search results.
      function(:text_in_results)              {|which| b.span(:class => 'uif-readOnlyContent',:text => /#{which}/)}
      function(:text_in_results?)             {|which| text_in_results(which).present?}
      # Find the 'return value' link for a row containing the given text.
      function(:return_by_text)               {|which| text_in_results(which).parent.parent.parent.td(:index => 0).div(:index => 0).fieldset(:index => 0).div(:index => 0).div(:index => 1).a(:text => /return value/)}
    end

    def wait_for_elements
      super
      @wait_on << :title_field << :barcode_field
      @wait_on << :search_button
    end
  end
end