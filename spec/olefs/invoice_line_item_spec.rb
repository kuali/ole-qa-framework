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

describe 'A PO Line Item on an OLE Invoice' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @parent_line = OLE_QA::Framework::OLEFS::Invoice_Line.new(@ole, 1)
    @line_item = OLE_QA::Framework::OLEFS::Invoice_Line_Item.new(@ole, @parent_line, 1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @line_item.class.should == OLE_QA::Framework::OLEFS::Invoice_Line_Item
    @line_item.class.superclass.should == OLE_QA::Framework::Subline_Object
  end

  it 'should have access to the line_number and line_id methods on the PO Line' do
    @line_item.parent_line.line_number.should == 1
    @line_item.parent_line.line_id.should     == 0
  end

  it 'should have line item elements' do
    elements = @line_item.elements
    elements.include?(:number).should be_true
    elements.include?(:open_quantity).should be_true
    elements.include?(:title).should be_true
    elements.include?(:copies_ordered).should be_true
    elements.include?(:parts_ordered).should be_true
    elements.include?(:copies_invoiced_field).should be_true
    elements.include?(:parts_invoiced_field).should be_true
    elements.include?(:invoiced_price_field).should be_true
    elements.include?(:discount_field).should be_true
    elements.include?(:discount_type_selector).should be_true
    elements.include?(:unit_cost).should be_true
    elements.include?(:extended_cost).should be_true
    elements.include?(:invoice_checkbox).should be_true
    elements.include?(:add_account_button).should be_true
    elements.include?(:new_chart_selector).should be_true
    elements.include?(:new_account_number_field).should be_true
    elements.include?(:new_subaccount_number_field).should be_true
    elements.include?(:new_object_code_field).should be_true
    elements.include?(:new_subobject_code_field).should be_true
    elements.include?(:new_project_field).should be_true
    elements.include?(:new_org_ref_id_field).should be_true
    elements.include?(:new_dollar_field).should be_true
    elements.include?(:new_percentage_field).should be_true
  end

  it 'should have line item functions' do
    functions = @line_item.functions
    functions.include?(:chart_selector).should be_true
    functions.include?(:account_number_field).should be_true
    functions.include?(:subaccount_number_field).should be_true
    functions.include?(:object_code_field).should be_true
    functions.include?(:subobject_code_field).should be_true
    functions.include?(:project_field).should be_true
    functions.include?(:org_ref_id_field).should be_true
    functions.include?(:dollar_field).should be_true
    functions.include?(:percentage_field).should be_true
    functions.include?(:delete_account_button).should be_true
  end
end