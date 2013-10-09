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

describe 'An OLE Invoice' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @invoice = OLE_QA::Framework::OLEFS::Invoice.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @invoice.class.should == OLE_QA::Framework::OLEFS::Invoice
    @invoice.class.superclass.should == OLE_QA::Framework::OLELS::E_Doc
  end

  it 'should have invoice elements' do
    elements = @invoice.elements
    elements.include?(:document_type_id).should be_true
    elements.include?(:document_type_status).should be_true
    elements.include?(:fiscal_year).should be_true
    elements.include?(:total_amount).should be_true
    elements.include?(:vendor_selector).should be_true
    elements.include?(:vendor_invoice_num_field).should be_true
    elements.include?(:payment_class_field).should be_true
    elements.include?(:vendor_invoice_amt_field).should be_true
    elements.include?(:invoice_type_selector).should be_true
    elements.include?(:bank_code_field).should be_true
    elements.include?(:pay_date_field).should be_true
    elements.include?(:immediate_pay_checkbox).should be_true
    elements.include?(:invoice_date_field).should be_true
    elements.include?(:pay_attachment_checkbox).should be_true
    elements.include?(:invoice_subtype_selector).should be_true
    elements.include?(:payment_method_selector).should be_true
    elements.include?(:po_number_field).should be_true
    elements.include?(:po_add_button).should be_true
    elements.include?(:freight_cost_field).should be_true
    elements.include?(:freight_description_field).should be_true
    elements.include?(:shipping_cost_field).should be_true
    elements.include?(:shipping_description_field).should be_true
    elements.include?(:min_order_cost_field).should be_true
    elements.include?(:min_order_description_field).should be_true
    elements.include?(:misc_cost_field).should be_true
    elements.include?(:misc_description_field).should be_true
    elements.include?(:prorate_price_checkbox).should be_true
    elements.include?(:prorate_qty_checkbox).should be_true
    elements.include?(:prorate_manual_checkbox).should be_true
    elements.include?(:no_prorate_checkbox).should be_true
    elements.include?(:grand_total).should be_true
    elements.include?(:submit_button).should be_true
    elements.include?(:save_button).should be_true
    elements.include?(:approve_button).should be_true
    elements.include?(:close_button).should be_true
    elements.include?(:cancel_button).should be_true
    elements.include?(:calculate_button).should be_true
  end

  it 'should have invoice functions' do
    functions = @invoice.functions
  end

  it 'should have a purchase order line' do
    @invoice.methods.include?(:po_line).should be_true
    @invoice.po_line.class.should == OLE_QA::Framework::OLEFS::Invoice_Line
  end
end