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
      element(:delete_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-deleteFieldSection_toggle')}
      element(:rename_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-renameFieldSection_toggle')}
      # New Filter Line Elements
      element(:filter_field_name_selector)              {b.select_list(:id => 'filterCriteria_filterFieldName_select_add_control')}
      element(:filter_field_name_field)                 {b.text_field(:id => 'filterCriteria_filterFieldName_text_add_control')}
      element(:filter_field_value_field)                {b.text_field(:id => 'filterCriteria_filterFieldValue_add_control')}
      element(:filter_field_range_from)                 {b.text_field(:id => 'filterCriteria_filterRangeFrom_add_control')}
      element(:filter_field_range_to)                   {b.text_field(:id => 'filterCriteria_filterRangeTo_add_control')}
      element(:add_filter_line_button)                  {b.button(:id => 'addFilterMapping_add')}
      # New Data Mapping Line Elements
      # See note on {OLE_QA::Framework::OLELS#set_elements} for an explanation of hard-coded line ID values.
      element(:add_data_mapping_line_button)            {b.button(:id => 'OLEBatchProcessProfileBo-MaintenanceView-dataMappingSection_add')}
      element(:data_type_selector)                      {b.select_list(:id => 'batchExportDataTypeField_line0_add_control')}
      element(:source_field_selector)                   {b.select_list(:id => 'remaining-sourcefield_line0_add_control')}
      element(:source_field_name_readonly)              {b.text_field(:id => 'dataMappingOptions_sourceField1_line0_add_control')}
      element(:source_field_value_field)                {b.text_field(:id => 'dataMappingOptions_sourceFieldValue_line0_add_control')}
      element(:destination_data_type_selector)          {b.select_list(:id => 'batchExportDataType-destinationfield_line0_add_control')}
      element(:destination_field_selector)              {b.select_list(:id => 'remaining-destinationField_line0_add_control')}
      element(:destination_field_field)                 {b.text_field(:id => 'dataMappingOptions_destinationField1_line0_add_control')}
      element(:destination_field_value_field)           {b.text_field(:id => 'dataMappingOptions_destinationFieldValue_line0_add_control')}
      element(:priority_field)                          {b.text_field(:id => 'dataMappingOptions_priority_line0_add_control')}
      element(:add_data_mapping_rule_button)            {b.button(:id => 'addDataMapping_line0_add')}
      # Field Deletion Elements
      element(:delete_name_field)                       {b.text_field(:id => 'deleteField_tag_add_control')}
      element(:delete_ind_1_field)                      {b.text_field(:id => 'deleteField_indicator1_add_control')}
      element(:delete_ind_2_field)                      {b.text_field(:id => 'deleteField_indicator2_add_control')}
      element(:delete_subfield_field)                   {b.text_field(:id => 'deleteField_subField_add_control')}
      element(:delete_subfield_contains_field)          {b.text_field(:id => 'deleteField_subFieldContains_add_control')}
      element(:add_delete_line_button)                  {b.button(:id => 'OLEBatchProcessProfileBo-MaintenanceView-deleteFieldSection_add')}
      # Field Renaming Elements
      element(:rename_orig_tag_field)                   {b.text_field(:id => 'originalField_originalTag_add_control')}
      element(:rename_orig_ind_1_field)                 {b.text_field(:id => 'originalField_originalIndicator1_add_control')}
      element(:rename_orig_ind_2_field)                 {b.text_field(:id => 'originalField_originalIndicator2_add_control')}
      element(:rename_orig_subfield_field)              {b.text_field(:id => 'originalField_originalSubField_add_control')}
      element(:rename_orig_contains_field)              {b.text_field(:id => 'originalField_originalSubFieldContains_add_control')}
      element(:rename_new_tag_field)                    {b.text_field(:id => 'renameField_renamedTag_add_control')}
      element(:rename_new_ind_1_field)                  {b.text_field(:id => 'renameField_renamedIndicator1_add_control')}
      element(:rename_new_ind_2_field)                  {b.text_field(:id => 'renameField_renamedIndicator2_add_control')}
      element(:rename_new_subfield_field)               {b.text_field(:id => 'renameField_renamedSubField_add_control')}
      element(:rename_new_contains_field)               {b.text_field(:id => 'renameField_renamedSubFieldContains_add_control')}
      element(:add_rename_field_button)                 {b.button(:id => 'OLEBatchProcessProfileBo-MaintenanceView-renameFieldSection_add')}
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
