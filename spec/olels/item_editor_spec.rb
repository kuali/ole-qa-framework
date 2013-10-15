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

require 'rspec'
require 'spec_helper'

describe 'An OLELS Item Editor page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @browser = @ole.browser
    @item_editor = OLE_QA::Framework::OLELS::Item_Editor.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @item_editor.class.should == OLE_QA::Framework::OLELS::Item_Editor
    @item_editor.class.superclass.should == OLE_QA::Framework::OLELS::Editor
  end

  it 'should have item editor elements' do
    elements = @item_editor.methods
    # Holdings Location/Call Number Information
    elements.include?(:holdings_location_field).should be_true
    elements.include?(:holdings_prefix_field).should be_true
    elements.include?(:holdings_shelving_order_field).should be_true
    elements.include?(:holdings_call_number_field).should be_true
    elements.include?(:holdings_call_number_type_field).should be_true
    # Item Location/Call Number Information
    elements.include?(:location_field).should be_true
    elements.include?(:prefix_field).should be_true
    elements.include?(:shelving_order_field).should be_true
    elements.include?(:call_number_field).should be_true
    elements.include?(:call_number_type_selector).should be_true
    elements.include?(:browse_button).should be_true
    # Item Information
    elements.include?(:item_id_field).should be_true
    elements.include?(:barcode_field).should be_true
    elements.include?(:barcode_arsl_field).should be_true
    elements.include?(:former_identifiers_field).should be_true
    elements.include?(:statistical_searching_codes_selector).should be_true
    elements.include?(:temp_item_type_selector).should be_true
    elements.include?(:enumeration_field).should be_true
    elements.include?(:chronology_field).should be_true
    elements.include?(:copy_number_field).should be_true
    elements.include?(:access_info_uri_field).should be_true
    elements.include?(:item_type_selector).should be_true
    elements.include?(:number_of_pieces_field).should be_true
    # Acquisition Information
    elements.include?(:po_line_item_id_field).should be_true
    elements.include?(:vendor_line_item_id_field).should be_true
    elements.include?(:fund_field).should be_true
    elements.include?(:price_field).should be_true
    elements.include?(:donor_public_display_field).should be_true
    elements.include?(:donor_note_field).should be_true
    # Circulation Information
    elements.include?(:item_status_selector).should be_true
    elements.include?(:checkin_note_field).should be_true
    elements.include?(:item_effective_status_date).should be_true
    elements.include?(:fast_add_checkbox).should be_true
    elements.include?(:staff_only_checkbox).should be_true
    # Extended Information
    elements.include?(:high_density_storage_field).should be_true
    # Read-Only Elements (non-iterative elements requiring no input)
    elements.should include(:readonly_edit_button)
    elements.should include(:readonly_item_id)
    elements.should include(:readonly_barcode)
    elements.should include(:readonly_enumeration)
    elements.should include(:readonly_chronology)
    elements.should include(:readonly_copy_number)
    elements.should include(:readonly_item_status)
    elements.should include(:readonly_item_type)
    elements.should include(:readonly_fast_add)

  end

  it 'should have an item note' do
    lines = @item_editor.lines
    lines.include?(:item_note).should be_true
    @item_editor.item_note.should be_an_instance_of(OLE_QA::Framework::OLELS::Item_Note)
  end
end
