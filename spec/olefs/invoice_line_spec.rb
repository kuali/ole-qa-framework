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

describe 'An OLE Invoice PO Line' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @invoice_line = OLE_QA::Framework::OLEFS::Invoice_Line.new(@ole,1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @invoice_line.class.should == OLE_QA::Framework::OLEFS::Invoice_Line
    @invoice_line.class.superclass.should == OLE_QA::Framework::OLEFS::Invoice_Line_Object
  end

  it 'should have invoice line elements' do
    elements = @invoice_line.elements
    elements.include?(:po_number).should be_true
    elements.include?(:po_end_date).should be_true
    elements.include?(:close_po_checkbox).should be_true
    elements.include?(:delete_po_button).should be_true
    elements.include?(:requisitions_toggle).should be_true
    elements.include?(:purchase_orders_toggle).should be_true
    elements.include?(:line_item_receiving_toggle).should be_true
    elements.include?(:correction_receiving_toggle).should be_true
    elements.include?(:payment_requests_toggle).should be_true
    elements.include?(:credit_memos_toggle).should be_true
    elements.include?(:add_button).should be_true
  end

  it 'should have invoice line functions' do
    functions = @invoice_line.functions
    # Unable to be implemented at this time (2013/10/04 - JKW).
    # functions.include?(:requisition_link).should be_true
    # functions.include?(:purchase_order_link).should be_true
    # functions.include?(:line_item_receiving_link).should be_true
    # functions.include?(:correction_receiving_link).should be_true
    # functions.include?(:payment_request_link).should be_true
    # functions.include?(:credit_memo_link).should be_true
  end

  it 'should have an instance of the invoice line item class' do
    @invoice_line.methods.include?(:line_item).should be_true
    @invoice_line.line_item.class.should == OLE_QA::Framework::OLEFS::Invoice_Line_Item
  end
end