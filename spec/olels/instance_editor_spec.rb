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

describe 'An OLELS Instance Editor page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @browser = @ole.browser
    @instance_editor = OLE_QA::Framework::OLELS::Instance_Editor.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @instance_editor.class.should == OLE_QA::Framework::OLELS::Instance_Editor
    @instance_editor.class.superclass.should == OLE_QA::Framework::OLELS::Editor
  end

  it 'should have instance editor elements' do
    elements = @instance_editor.methods
    elements.include?(:location_toggle).should be_true
    elements.include?(:location_field).should be_true
    elements.include?(:call_number_toggle).should be_true
    elements.include?(:prefix_field).should be_true
    elements.include?(:call_number_field).should be_true
    elements.include?(:shelving_order_field).should be_true
    elements.include?(:call_number_type_selector).should be_true
    elements.include?(:call_number_browse_button).should be_true
    elements.include?(:ownership_extent_toggle).should be_true
    elements.include?(:extended_information_toggle).should be_true
    elements.include?(:receipt_status_selector).should be_true
    elements.include?(:holding_notes_toggle).should be_true
    elements.include?(:holdings_notes_toggle).should be_true
    # Read-Only Elements (non-iterative fields, no input required)
    elements.should include(:readonly_edit_button)
    elements.should include(:readonly_location)
    elements.should include(:readonly_prefix)
    elements.should include(:readonly_call_number)
    elements.should include(:readonly_call_number_type)
    elements.should include(:readonly_shelving_order)
    elements.should include(:readonly_created_by)
    elements.should include(:readonly_created_date)
  end

  it 'should have instance editor functions' do
  end

  it 'should have instance editor lines' do
    lines = @instance_editor.lines
    lines.include?(:ownership_extent_line).should be_true
    lines.include?(:access_info_line).should be_true
    lines.include?(:holdings_note_line).should be_true
    @instance_editor.ownership_extent_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Ownership_Extent_Line)
    @instance_editor.access_info_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Access_Info_Line)
    @instance_editor.holdings_note_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Holdings_Note)
  end
end