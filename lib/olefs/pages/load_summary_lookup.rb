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

module OLE_QA::Framework::OLEFS
  # An OLE Financial System Load Summary Lookup page.
  class Load_Summary_Lookup < Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Load%20Reports&channelUrl=batchlookup.do?methodToCall=start&businessObjectClassName=org.kuali.ole.select.businessobject.OleLoadSumRecords&docFormKey=88888888&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true'
      super(ole_session, url)
    end

    # Define Load Summary Lookup screen elements.
    def set_elements
      super
      element(:description_field)                   {b.text_field(:id => 'acqLoadDescription')}
      element(:filename_field)                      {b.text_field(:id => 'fileName')}
      element(:user_id_field)                       {b.text_field(:id => 'principalId')}
      element(:load_profile_selector)               {b.select_list(:id => 'profileId')}
      element(:date_from_field)                     {b.text_field(:name => 'rangeLowerBoundKeyPrefix_loadCreatedDate')}
      element(:date_to_field)                       {b.text_field(:id => 'loadCreatedDate')}
    end

    # Define commonly used functions for Load Summary Lookup screen.
    def set_functions
      super
      # Return the link to a document by any text in the row.
      function(:doc_link_by_text)               {|which| b.td(:xpath => "//table[@id='row']/descendant::td[contains(text(),'#{which}')]").parent.td(:index => 0).a}
    end
  end
end