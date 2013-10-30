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

describe 'An OLEFS Receiving Line object' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @browser = @ole.browser
    @rcv_line = OLE_QA::Framework::OLEFS::Receiving_Line.new(@ole, 1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @rcv_line.class.should == OLE_QA::Framework::OLEFS::Receiving_Line
    @rcv_line.class.superclass.should == OLE_QA::Framework::Line_Object
  end

  it 'should have a browser accessor' do
    @rcv_line.browser.class.should == @ole.browser.class
  end

  it 'should have a line number' do
    @rcv_line.line_number.should == 1
  end

  it 'should have receiving line elements' do
    elements = @rcv_line.elements
    elements.include?(:receive_button).should be_true
    elements.include?(:description_field).should be_true
    elements.include?(:quantity_ordered_field).should be_true
    elements.include?(:parts_ordered_field).should be_true
    elements.include?(:prior_quantity_received_field).should be_true
    elements.include?(:prior_parts_received_field).should be_true
    elements.include?(:quantity_to_be_received_field).should be_true
    elements.include?(:parts_to_be_received_field).should be_true
    elements.include?(:item_received_quantity_field).should be_true
    elements.include?(:item_received_parts_field).should be_true
    elements.include?(:item_returned_quantity_field).should be_true
    elements.include?(:item_returned_parts_field).should be_true
    elements.include?(:item_damaged_quantity_field).should be_true
    elements.include?(:item_damaged_parts_field).should be_true
    elements.include?(:available_to_public_checkbox).should be_true
    elements.include?(:public_view_checkbox).should be_true
    elements.include?(:exception_notes_toggle).should be_true
    elements.include?(:receipt_notes_toggle).should be_true
    elements.include?(:special_processing_instructions_toggle).should be_true
  end

  it 'should have receipt notes elements' do
    elements = @rcv_line.elements
    elements.include?(:receipt_note_type_selector).should be_true
    elements.include?(:receipt_note_field).should be_true
    elements.include?(:add_receipt_note_button).should be_true
  end

  it 'should have exception notes elements' do
    elements = @rcv_line.elements
    elements.include?(:exception_note_type_selector)
    elements.include?(:exception_note_field)
    elements.include?(:add_exception_note_button)
  end

  it 'should have sublines' do
    sublines = @rcv_line.sublines
    sublines.include?(:exception_notes_line).should be_true
    sublines.include?(:receipt_notes_line).should be_true
    sublines.include?(:copies_line).should be_true
    sublines.include?(:processing_line).should be_true
  end
end