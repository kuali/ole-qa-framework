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
  # The OLE Library System MARC Instance Record Editor Screen
  class Instance_Editor < Editor
    # Set OLELS Instance Editor page elements.
    def set_elements
      super
      element(:location_toggle)                       {b.a(:id => "OleLocationInformationSection_toggle")}
      element(:location_field)                        {b.text_field(:id => "OleHoldingLocation_control")}
      element(:call_number_toggle)                    {b.a(:id => "OleCallNumberInformation_toggle")}
      element(:prefix_field)                          {b.text_field(:id => "OleHoldingCallNumberPrefix_control")}
      element(:call_number_field)                     {b.text_field(:id => "OleHoldingCallNumber_control")}
      element(:shelving_order_field)                  {b.text_field(:id => "OleHoldingShelvingOrder_control")}
      element(:call_number_type_selector)             {b.select_list(:id => "OleHoldingShelvingScheme_control")}
      element(:call_number_browse_button)             {b.button(:id => "callNumberHoldingsBrowseLink")}
      element(:ownership_extent_toggle)               {b.a(:id => "OleExtentOfOwnershipSection_toggle")}
      element(:extended_information_toggle)           {b.a(:id => "OleExtendedInformationSection_toggle")}
      element(:receipt_status_selector)               {b.select_list(:id => "OleReceiptStatusField_control")}
      element(:holding_notes_toggle)                  {b.a(:id => "OleHoldingNotes_toggle")}
      element(:holdings_notes_toggle)                 {b.a(:id => "OleHoldingNotes_toggle")}
      # Read-Only Elements (non-iterative fields not requiring input)
      element(:readonly_edit_button)                  {b.button(:text => /Edit/)}
      element(:readonly_location)                     {b.span(:id => 'OleHoldingLocation_control')}
      element(:readonly_prefix)                       {b.span(:id => 'OleHoldingCallNumberPrefix_control')}
      element(:readonly_call_number)                  {b.span(:id => 'OleHoldingCallNumber_control')}
      element(:readonly_call_number_type)             {b.span(:id => 'OleHoldingShelvingScheme_control')}
      element(:readonly_shelving_order)               {b.span(:id => 'OleHoldingShelvingOrder_control')}
      element(:readonly_created_by)                   {b.span(:id => 'createdByHolding_control')}
      element(:readonly_created_date)                 {b.span(:id => 'createdDateHolding_control')}
    end

    # Wait for location field to appear when opening page.
    def wait_for_elements
      super
    end

    def set_lines
      set_line(:ownership_extent_line, OLE_QA::Framework::OLELS::Ownership_Extent_Line)
      set_line(:access_info_line, OLE_QA::Framework::OLELS::Access_Info_Line)
      set_line(:holdings_note_line, OLE_QA::Framework::OLELS::Holdings_Note)
    end
  end
end