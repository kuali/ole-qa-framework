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
  # The location level lookup screen in the OLE Library System
  class Location_Level_Lookup < OLE_QA::Framework::OLELS::Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Location Level&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.describe.bo.OleLocationLevel&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:level_id_icon)                                       {b.input(:title => 'Direct Inquiry')}
      element(:level_code_field)                                    {b.text_field(:name => 'lookupCriteria[levelCode]')}
      element(:level_name_field)                                    {b.text_field(:name => 'lookupCriteria[levelName]')}
      element(:search_button)                                       {b.button(:text => /[Ss]earch/)}
      element(:clear_button)                                        {b.button(:text => /[Cc]lear/)}
      element(:cancel_button)                                       {b.button(:text => /[Cc]ancel/)}
    end

    def set_functions
      super
      # Query whether the given text value exists in the search results.
      function(:text_in_results?)                                   {|which| b.span(:xpath => "//td/div/span[contains(text(),'#{which}')]")}
      # Return the 'edit' link for a search results line containing a given value.
      function(:edit_by_text)                                       {|which| b.a(:xpath => "//tr[td/div/span[contains(text(),'#{which}')]]/td[1]/div/fieldset/div/div/a[contains(text(),'edit')]")}
      # Return the 'Level ID' link for a search results line containing a given value.
      function(:id_by_text)                                         {|which| b.a(:xpath => "//tr[td/div/span[contains(text(),'#{which}')]]/td[2]/div/span/a")}
      # Return the 'Parent Level ID' link for a search results line containing a given value.
      function(:parent_id_by_text)                                  {|which| b.a(:xpath => "//tr[td/div/span[contains(text(),'#{which}')]]/td[5]/div/span/a")}
    end

    def wait_for_elements
      super
      @wait_on << :level_code_field
      @wait_on << :search_button
    end
  end
end