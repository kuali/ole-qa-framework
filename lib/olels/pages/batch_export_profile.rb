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
  # A Batch Export Process Profile Page in the OLE Library System
  class Batch_Export_Profile < OLE_QA::Framework::OLELS::Batch_Profile
    def set_elements
      super
      element(:data_to_export_selector)                 {b.select_list(:id => 'mainSection-MaintenanceView-dataToExport_control')}
      element(:export_scope_selector)                   {b.select_list(:id => 'mainSection-MaintenanceView-exportScope_control')}
      element(:filter_criteria_toggle)                  {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-filterCriteriaSection_toggle')}
      element(:data_mapping_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-dataMappingSection_toggle')}
      element(:add_data_mapping_button)                 {b.button(:id => 'OLEBatchProcessProfileBo-MaintenanceView-dataMappingSection_add')}
      element(:delete_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-deleteFieldSection_toggle')}
      element(:rename_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-renameFieldSection_toggle')}
    end

    def wait_for_elements
      super
    end

    def set_functions
      super
    end

    def set_lines
      set_line(:filter_line,OLE_QA::Framework::OLELS::Export_Filter_Line)
      set_line(:data_mapping_line, OLE_QA::Framework::OLELS::Batch_Data_Mapping_Line)
      set_line(:delete_field_line, OLE_QA::Framework::OLELS::Batch_Delete_Field_Line)
      set_line(:rename_field_line, OLE_QA::Framework::OLELS::Batch_Rename_Field_Line)
    end
  end
end
