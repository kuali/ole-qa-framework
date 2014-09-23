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
  class Batch_Order_Profile < Batch_Profile
    def set_elements
      super
      element(:marc_only)                               {b.checkbox(:id => 'mainSection-MaintenanceView-marcOnly_control')}
      element(:marc_only?)                              {marc_only.when_present.checked?}
      element(:bib_profile_search)                      {b.fieldset(:id => 'mainSection-MaintenanceView-bibImportProfileForOrderRecord_fieldset').input(:class => 'uif-actionImage')}
      element(:bib_profile_field)                       {b.text_field(:id => 'mainSection-MaintenanceView-bibImportProfileForOrderRecord_control')}
      element(:bib_profile)                             {bib_profile_field.when_present.value.strip}
    end
  
    def set_functions
      super
    end

    def wait_for_elements
      super
    end
  end
end
