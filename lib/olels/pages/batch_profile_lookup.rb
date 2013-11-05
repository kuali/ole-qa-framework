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
  # The Batch Process Profile Lookup Screen in the OLE Library System
  class Batch_Profile_Lookup < OLE_QA::Framework::OLELS::Lookup
    def set_elements
      super
      element(:create_new)                            {b.link(:text => 'Create New')}
      element(:profile_name_field)                    {b.text_field(:id => 'lookup-batchProcessProfileName_control')}
      element(:profile_description_field)             {b.text_field(:id => 'lookup-batchProcessProfileDesc_control')}
      element(:profile_type_selector)                 {b.select_list(:id => 'lookup-batchProcessProfileType_control')}
      element(:krms_profile_selector)                 {b.select_list(:id => 'lookup-krmsProfileName_control')}
      element(:search_button)                         {b.button(:id => 'searchReqBtn')}
      element(:clear_button)                          {b.button(:id => 'clearReqBtn')}
      element(:cancel_button)                         {b.button(:id => 'cancelReqBtn')}
    end
  end
end