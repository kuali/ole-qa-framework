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


describe 'A PURAP requisition document' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @req = OLE_QA::Framework::OLEFS::Requisition.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @req.class.should == OLE_QA::Framework::OLEFS::Requisition
  end

  it 'should be a subclass of an OLEFS E-Document' do
    @req.class.superclass.should == OLE_QA::Framework::OLEFS::PURAP_Document
  end

  it 'should open a new purap_requisition via url' do
    @req.open
    @req.title.text.strip.should == "Requisition"
  end

  it 'should have requisition elements' do
    elements = @req.elements
    elements.include?(:license_request_checkbox).should be_true
    elements.include?(:receiving_required_checkbox).should be_true
    elements.include?(:payment_request_approval_required_checkbox).should be_true
    elements.include?(:additional_info_tab_toggle).should be_true
    elements.include?(:additional_info_phone_number_field).should be_true
    elements.include?(:delivery_tab_toggle).should be_true
    elements.include?(:building_field).should be_true
    elements.include?(:campus_field).should be_true
    elements.include?(:room_field).should be_true
    elements.include?(:building_search_icon).should be_true
    elements.include?(:campus_search_icon).should be_true
    elements.include?(:delivery_phone_number_field).should be_true
    elements.include?(:vendor_tab_toggle).should be_true
    elements.include?(:vendor_name_field).should be_true
    elements.should include(:vendor_alias_field)
    elements.should include(:select_vendor_button)
    elements.include?(:closed_vendor_name_field).should be_true
    elements.include?(:vendor_search_icon).should be_true
    elements.include?(:grand_total_field).should be_true
  end

  it 'should have a line item' do
    @req.lines.include?(:line_item).should be_true
    @req.line_item.should be_an_instance_of(OLE_QA::Framework::OLEFS::Line_Item)
  end
end