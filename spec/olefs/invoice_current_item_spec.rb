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

describe 'An OLEFS Invoice Current Item line' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line_object = OLE_QA::Framework::OLEFS::Invoice_Current_Item.new(@ole, 1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @line_object.class.should == OLE_QA::Framework::OLEFS::Invoice_Current_Item
    @line_object.class.superclass.should == OLE_QA::Framework::Line_Object
  end

  it 'should have current item elements' do
    elements = @line_object.elements
    elements.include?(:po_number).should be_true
    elements.include?(:open_quantity).should be_true
    elements.include?(:title).should be_true
    elements.include?(:po_price).should be_true
    elements.include?(:copies_invoiced_field).should be_true
    elements.include?(:invoiced_price_field).should be_true
    elements.include?(:discount_field).should be_true
    elements.include?(:discount_type_selector).should be_true
    elements.include?(:unit_cost).should be_true
    elements.include?(:extended_cost).should be_true
    elements.include?(:total_cost).should be_true
  end
end