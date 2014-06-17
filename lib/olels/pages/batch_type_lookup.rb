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
  # The Batch Process Type Lookup Screen in the OLE Library System
  class Batch_Type_Lookup < OLE_QA::Framework::OLELS::Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Type&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.batch.bo.OLEBatchProcessTypeBo&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:id_field)                  {b.text_field(:id => 'lookup-batchProcessTypeId_control')}
      element(:name_field)                {b.text_field(:id => 'lookup-batchProcessTypeName_control')}
      element(:type_code_field)           {b.text_field(:id => 'lookup-batchProcessTypeCode_control')}
      element(:active_yes)                {b.radio(:id => 'lookup-active_control_0')}
      element(:active_no)                 {b.radio(:id => 'lookup-active_control_1')}
      element(:active_both)               {b.radio(:id => 'lookup-active_control_2')}
      element(:search_button)             {b.button(:text => /[Ss]earch/)}
      element(:clear_button)              {b.button(:text => /[Cc]lear/)}
      element(:cancel_button)             {b.button(:id => /[Cc]lose/)}
    end

    def wait_for_elements
      super
      @wait_on << :id_field
      @wait_on << :search_button
    end

    def set_functions
      super
      # If the given text exists in a TD element in the search results, return that element.
      function(:text_in_results)            {|text| b.td(:xpath => "//table/tbody/tr/td[div/span[contains(text(),'#{text}')]]")}
      # Return true or false based on whether the given text is found in the search results.
      function(:text_in_results?)           {|text| text_in_results(text).present?}
      # Return the Batch Process Type ID link for a row containing the given text.
      function(:id_by_text)                 {|text| b.a(:xpath => "//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div[starts-with(@id,'result-batchProcessTypeId')]/span/a")}
      # Return the 'return value' link for a row containing the given text.
      function(:return_by_text)             {|text| b.a(:xpath => "//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div/fieldset/div/div/a[contains(text(),'return value')]")}
    end
  end
end