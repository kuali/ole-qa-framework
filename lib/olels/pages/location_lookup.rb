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
  # The location lookup screen in the OLE Library System
  class Location_Lookup < OLE_QA::Framework::OLELS::Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Location &channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.describe.bo.OleLocation&returnLocation='
      url += ole_session.url +  'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:location_id_field)                                       {b.text_field(:id => 'locationId_control')}
      element(:location_code_field)                                     {b.text_field(:id => 'locationCode_control')}
      element(:location_name_field)                                     {b.text_field(:id => 'locationName_control')}
      element(:location_level_field)                                    {b.text_field(:id => 'levelId_control')}
      element(:location_level_icon)                                     {b.input(:title => 'Search Field')}
      element(:search_button)                                           {b.button(:text => /[Ss]earch/)}
      element(:clear_button)                                            {b.button(:text => /[Cc]lear/)}
      element(:cancel_button)                                           {b.button(:text => /[Cc]ancel/)}
    end

    def set_functions
      super
      # Return the span element containing the given text, if it is found in the search results.
      function(:text_in_results)                                       {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]")}
      # A function to query whether a given text value exists in the search results.
      function(:text_in_results?)                                       {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]").present?}
      # Return the 'edit' link for a search results line containing the given text.
      function(:edit_by_text)                                           {|which| b.a(:xpath => "//td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'edit')]")}
      # Return the 'copy' link for a search results line containing the given text.
      function(:copy_by_text)                                           {|which| b.a(:xpath => "//td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'copy')]")}
      # Return the 'return results' link for a search results line containing the given text.
      # @note Used when the lookup screen is opened from another page, like the create/edit location page.
      function(:return_by_text)                                         {|which| b.a(:xpath => "//td[div/span[contains(text(),'#{which}')]]/preceding-sibling::td/div/fieldset/div/div/a[contains(text(),'return value')]")}
      # Return the ID or Parent ID element from a search results line containing the given text.
      function(:id_by_text)                                             {|which| b.span(:xpath => "//tr[td/div/span[contains(text(),'#{which}')]]/td[2]/div/span")}
      function(:parent_id_by_text)                                      {|which| b.span(:xpath => "//tr[td/div/span[contains(text(),'#{which}')]]/td[5]/div/span")}
    end

    def wait_for_elements
      super
      @wait_on << :location_id_field
      @wait_on << :search_button
    end
  end
end