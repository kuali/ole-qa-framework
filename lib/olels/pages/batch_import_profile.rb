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
  # A Batch Import Process Profile Page in the OLE Library System
  class Batch_Import_Profile < OLE_QA::Framework::OLELS::Batch_Profile
    def set_elements
      super
      # Toggle Elements
      element(:match_point_toggle)                      {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-bibMatchPointSection_toggle')}
      element(:bib_overlay_toggle)                      {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-bibAddOverlaySection_toggle')}
      element(:instance_overlay_toggle)                 {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-instanceAddOverlaySection_toggle')}
      element(:bib_status_toggle)                       {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-bibStatusSection_toggle')}
      element(:staff_only_toggle)                       {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-staffOnlySection_toggle')}
      element(:bib_changes_toggle)                      {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-changesToImport_toggle')}
      element(:defaults_toggle)                         {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-profileConstantsSection_toggle')}
      element(:data_mapping_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-dataMappingSection_toggle')}
      element(:protected_fields_toggle)                 {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-protectedFieldSection_toggle')}
      element(:delete_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-deleteFieldSection_toggle')}
      element(:rename_field_toggle)                     {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-renameFieldSection_toggle')}
      # Bib Match Point Elements
      element(:new_match_point_field)                   {b.text_field(:id => 'bibMatchPoint-oleBibMatchPoint_add_control')}
      element(:add_match_point_button)                  {b.button(:id => 'addProfileConstant_add')}
      # Bib Overlay/Add Elements
      element(:match_and_none)                          {b.radio(:id => 'bibAddOverlaySectionMatch-bibOverlayOrAddOrNone_control_0')}
      element(:match_and_overlay)                       {b.radio(:id => 'bibAddOverlaySectionMatch-bibOverlayOrAddOrNone_control_1')}
      element(:match_and_add)                           {b.radio(:id => 'bibAddOverlaySectionMatch-bibOverlayOrAddOrNone_control_2')}
      # Instance Overlay/Add Elements
      element(:instance_delete_and_add)                 {b.radio(:id => 'bibAddOverlaySectionMatch-instanceOverlayOrAddOrNone_control_0')}
      element(:instance_keep_and_add)                   {b.radio(:id => 'bibAddOverlaySectionMatch-instanceOverlayOrAddOrNone_control_1')}
      element(:instance_keep_and_no_add)                {b.radio(:id => 'bibAddOverlaySectionMatch-instanceOverlayOrAddOrNone_control_2')}
      element(:new_bib_no_instance)                     {b.radio(:id => 'bibAddOverlaySectionNoMatch-instanceNoMatch_control_0')}
      element(:new_bib_new_instance)                    {b.radio(:id => 'bibAddOverlaySectionNoMatch-instanceNoMatch_control_1')}
      # Bib Status Elements
      element(:bib_status_selector)                     {b.select_list(:id => 'bibStatus-newBibStaus_control')}
      element(:overlay_bib_status_yes)                  {b.radio(:id => 'bibStatus-noChangeOrSet_control_0')}
      element(:overlay_bib_status_no)                   {b.radio(:id => 'bibStatus-noChangeOrSet_control_1')}
      # Staff-Only Options
      element(:staff_only_new_bib)                      {b.checkbox(:id => 'bibSetStaffOnly-bibStaffOnly_control')}
      element(:staff_only_new_instance)                 {b.checkbox(:id => 'instanceSetStaffOnly-instanceStaffOnly_control')}
      element(:staff_only_new_item)                     {b.checkbox(:id => 'itemSetStaffOnly-itemStaffOnly_control')}
      # Changes to Imported Record
      element(:bib_delete_001)                          {b.radio(:id => 'changesToImport-dontChange001_control_0')}
      element(:bib_set_001_to_035)                      {b.radio(:id => 'changesToImport-dontChange001_control_1')}
      # Constant and Default Values Elements
      element(:new_data_type_selector)                  {b.select_list(:id => 'profileConstants_dataType_add_control')}
      element(:new_field_name_selector)                 {b.select_list(:id => 'constant-datatype-remaining_add_control')}
      element(:new_field_name_field)                    {b.text_field(:id => 'profileConstants_attributeName1_add_control')}
      element(:new_field_value_field)                   {b.text_field(:id => 'profileConstants_attributeValue_add_control')}
      element(:new_constant_option)                     {b.radio(:id => 'profileConstants_defaultValue_add_control_0')}
      element(:new_default_option)                      {b.radio(:id => 'profileConstants_defaultValue_add_control_1')}
      element(:add_default_button)                      {b.button(:id => 'OLEBatchProcessProfileBo-MaintenanceView-profileConstantsSection_add')}
      # New Filter Line Elements
      element(:filter_field_name_selector)              {b.select_list(:id => 'filterCriteria_filterFieldName_select_add_control')}
      element(:filter_field_name_field)                 {b.text_field(:id => 'filterCriteria_filterFieldName_text_add_control')}
      element(:filter_field_value_field)                {b.text_field(:id => 'filterCriteria_filterFieldValue_add_control')}
      element(:filter_field_range_from)                 {b.text_field(:id => 'filterCriteria_filterRangeFrom_add_control')}
      element(:filter_field_range_to)                   {b.text_field(:id => 'filterCriteria_filterRangeTo_add_control')}
      element(:add_filter_line_button)                  {b.button(:id => 'addFilterMapping_add')}
      # New Data Mapping Line Elements
      # See note on {OLE_QA::Framework::OLELS::Batch_Data_Mapping_Line#set_elements} for an explanation of hard-coded line ID values.
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
      # Globally Protected Fields Checkboxes
      element(:gpf_ignore_650)                          {b.checkbox(:id => 'batchGloballyProtectedFields_ignoreValue_line4_control')}
      element(:gpf_ignore_790)                          {b.checkbox(:id => 'batchGloballyProtectedFields_ignoreValue_line0_control')}
      element(:gpf_ignore_791)                          {b.checkbox(:id => 'batchGloballyProtectedFields_ignoreValue_line1_control')}
      element(:gpf_ignore_792)                          {b.checkbox(:id => 'batchGloballyProtectedFields_ignoreValue_line2_control')}
      element(:gpf_ignore_793)                          {b.checkbox(:id => 'batchGloballyProtectedFields_ignoreValue_line3_control')}
      # Profile Protected Fields - New Line Elements
      element(:protected_tag_field)                     {b.text_field(:id => 'profileProtectedFields_tag_add_control')}
      element(:protected_ind_1_field)                   {b.text_field(:id => 'profileProtectedFields_firstIndicator_add_control')}
      element(:protected_ind_2_field)                   {b.text_field(:id => 'profileProtectedFields_secondIndicator_add_control')}
      element(:protected_subfield_field)                {b.text_field(:id => 'profileProtectedFields_secondIndicator_add_control')}
      element(:protected_subfield_match_field)          {b.text_field(:id => 'profileProtectedFields_subFieldContains_add_control')}
      element(:add_button)                              {b.button(:id => 'OLEBatchProcessProfile-profileProtectedFields_add')}
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

      # Matching, Add, and Overlay Section
      element(:match_section_toggle)                    {b.a(:id => 'OLEBatchProcessProfileBo-MaintenanceView-matchingAddOverlaySection_toggle')}
      element(:match_section_toggled?)                  {b.div(:id => 'OLEBatchProcessProfileBo-MaintenanceView-matchingAddOverlaySection').visible?}
      # - Do not perform matching
      element(:bib_no_match)                            {b.radio(:id => 'OLEBatchProcessProfileBo-MaintenanceView-matchingAddOverlaySection')}
      element(:bib_no_match_add)                        {b.radio(:id => 'matchingAddOverlaySection-bibNotMatch-addBibs_control_0')}
      # - Perform matching
      element(:bib_do_match)                            {b.radio(:id => 'matchingAddOverlaySection-bibMatch_control_0')}
      # - - If bib does not match
      element(:bib_discard_no_match)                    {b.radio(:id => 'matchingAddOverlaySection-bibNotMatched-discardBib_control_0')}
      element(:bib_add_no_match)                        {b.radio(:id => 'matchingAddOverlaySection-bibNotMatched-discardBib_control_1')}
      # - - If bib does match
      element(:bib_add_match)                           {b.radio(:id => 'matchingAddOverlaySection-bibMatched-discardBib_control_0')}
      element(:bib_process_match)                       {b.radio(:id => 'matchingAddOverlaySection-bibMatched-discardBib_control_1')}
      # - - - Process bib
      element(:bib_discard_match)                       {b.radio(:id => 'matchingAddOverlaySection-bibMatched-discardOrUpdate_control_0')}
      element(:bib_overlay_match)                       {b.radio(:id => 'matchingAddOverlaySection-bibMatched-discardOrUpdate_control_1')}

      # - - - - Overlay Bib Status
      # Process Holdings and Items
    end

    def wait_for_elements
      super
    end

    def set_functions
      super
    end

    def set_lines
      set_line(:match_point_line,       OLE_QA::Framework::OLELS::Import_Match_Line)
      set_line(:defaults_line,          OLE_QA::Framework::OLELS::Import_Defaults_Line)
      set_line(:protected_fields_line,  OLE_QA::Framework::OLELS::Import_PF_Line)
      set_line(:data_mapping_line,      OLE_QA::Framework::OLELS::Batch_Data_Mapping_Line)
      set_line(:delete_field_line,      OLE_QA::Framework::OLELS::Batch_Delete_Field_Line)
      set_line(:rename_field_line,      OLE_QA::Framework::OLELS::Batch_Rename_Field_Line)
    end
  end

end
