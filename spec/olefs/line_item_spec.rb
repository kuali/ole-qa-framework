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


describe 'An OLEFS line item' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line_number = 1
    @line_item = OLE_QA::Framework::OLEFS::Line_Item.new(@ole, @line_number)
    @new_line_item = OLE_QA::Framework::OLEFS::New_Line_Item.new(@ole, @line_number)
  end

	after :all do
		@ole.quit
	end

  it 'should should create a new instance' do
    @line_item.class.should == OLE_QA::Framework::OLEFS::Line_Item
    @new_line_item.class.should == OLE_QA::Framework::OLEFS::New_Line_Item
  end

  it 'should be a subclass of Line Object' do
    @line_item.class.superclass.should == OLE_QA::Framework::OLEFS::Line_Object
    @new_line_item.class.superclass.should == OLE_QA::Framework::OLEFS::Line_Object
  end

  it 'should have a browser accessor' do
    @line_item.browser.class.should == @ole.browser.class
    @new_line_item.browser.class.should == @ole.browser.class
  end

  it 'should have line number attributes' do
    @line_item.line_number.should == 1
    @new_line_item.line_number.should == 0
  end

  it 'should have line item elements' do
    elements = @line_item.elements
    elements.should include(:copies_field)
    elements.should include(:parts_field)
    elements.should include(:list_price_field)
    elements.should include(:discount_field)
    elements.should include(:item_price_source_selector)
    elements.should include(:request_source_selector)
    elements.should include(:item_type_selector)
    elements.should include(:format_selector)
    elements.should include(:category_selector)
    elements.should include(:discount_type_selector)
    elements.should include(:delete_button)
    elements.should include(:route_to_requestor_checkbox)
    elements.should include(:public_view_checkbox)
    elements.should include(:accounting_lines_toggle)
    elements.should include(:description_field)
    elements.should include(:item_type_field)
    elements.should include(:extended_cost_field)
    elements.should include(:receipt_status_field)
    elements.should include(:closed_description_field)
    elements.should include(:closed_item_type_field)
    elements.should include(:closed_extended_cost_field)
    elements.should include(:closed_list_price_field)
    elements.should include(:closed_copies_field)
    elements.should include(:closed_parts_field)
    elements.should include(:closed_receipt_status_field)
    elements.should include(:closed_copies_received_field)
    elements.should include(:closed_parts_received_field)
    elements.should include(:closed_item_price_source_field)
    elements.should include(:closed_request_source_field)
    elements.should include(:closed_format_field)
    elements.should include(:closed_category_field)
    elements.should include(:closed_vendor_item_id_field)
    elements.should include(:closed_requestor_field)
    elements.should include(:closed_route_to_requestor_field)
    elements.should include(:closed_unit_cost_field)
    elements.should include(:closed_discount_field)
    elements.should include(:closed_discount_type_field)
    #TODO add the methods below when OLE-4329 is fixed.
    # elements.should include(:notes_toggle)
    # methods_array.include(:copies_toggle)
  end

  it 'should have subline objects' do
    methods = @line_item.methods
    methods.include?(:new_accounting_line).should be_true
    methods.include?(:new_notes_line).should be_true
    methods.include?(:new_copies_line).should be_true
  end

  it 'should have new line item elements' do
    elements = @new_line_item.methods
    elements.should include(:new_bib)
    elements.should include(:existing_bib)
    elements.should include(:bib_search_button)
    elements.should include(:new_bib_button)
    elements.should include(:item_type_selector)
    elements.should include(:copies_field)
    elements.should include(:parts_field)
    elements.should include(:list_price_field)
    elements.should include(:public_view_checkbox)
    elements.should include(:item_price_source_selector)
    elements.should include(:request_source_selector)
    elements.should include(:format_selector)
    elements.should include(:category_selector)
    elements.should include(:route_to_requestor_checkbox)
    elements.should include(:discount_field)
    elements.should include(:discount_type_selector)
    elements.should include(:add_button)
  end

  it 'should create an accounting line' do
    @line_item.create_accounting_line(1)
    @line_item.methods.include?(:accounting_line_1).should be_true
    @line_item.accounting_line_1.class.should == OLE_QA::Framework::OLEFS::Accounting_Line
  end

  it 'should create a notes line' do
    @line_item.create_notes_line(1)
    @line_item.methods.include?(:notes_line_1).should be_true
    @line_item.notes_line_1.class.should == OLE_QA::Framework::OLEFS::Notes_Line
  end

  it 'should create a copies line' do
    @line_item.create_copies_line(1)
    @line_item.methods.include?(:copies_line_1).should be_true
    @line_item.copies_line_1.class.should == OLE_QA::Framework::OLEFS::Copies_Line
  end

  it 'should remove an accounting line' do
    @line_item.remove_accounting_line(1)
    @line_item.methods.include?(:accounting_line_1).should be_false
  end

  it 'should remove a notes line' do
    @line_item.remove_notes_line(1)
    @line_item.methods.include?(:notes_line_1).should be_false
  end

  it 'should remove a copies line' do
    @line_item.remove_copies_line(1)
    @line_item.methods.include?(:copies_line_1).should be_false
  end

  it 'should raise an error when asked to remove a subline which does not exist' do
    lambda {@line_item.remove_accounting_line(1)}.should raise_error
    lambda {@line_item.remove_notes_line(1)}.should raise_error
    lambda {@line_item.remove_copies_line(1)}.should raise_error
  end
end
