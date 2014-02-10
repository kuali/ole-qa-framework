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
  # The Building Lookup Screen in OLEFS
  class Building_Lookup < Lookup
    # Set URL and initialize.
    def initialize(ole_session)
      # Set @url instance variable from OLE Base URL variable
      url = ole_session.url + \
        'portal.do?channelTitle=Building&channelUrl=kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.ole.sys.businessobject.Building&docFormKey=88888888&returnLocation='\
        + ole_session.url + \
        'portal.do&hideReturnLink=true'
      super(ole_session, url)
    end

    # Set Building Lookup screen elements.
    def set_elements
      super
      element(:campus_code_field)                             {b.text_field(:id => "campusCode")}
      element(:building_code_field)                           {b.text_field(:id => "buildingCode")}
      element(:building_name_field)                           {b.text_field(:id => "buildingName")}
    end

    def set_functions
      super
      # The 'return selection' link for a given text value in the search results.
      function(:return_result)                                {|which| b.td(:text => which).parent.td(:index => 0).a}
      # Return the TD containing the given text, if it exists in the search results.
      function(:text_in_results)                              {|which| b.td(:text => which)}
      # Return true or false depending on whether the given text exists in the search results.
      function(:text_in_results?)                             {|which| text_in_results(which).present?}
    end
  end
end
