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

describe 'An OLEFS Receiving Document page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @rcv = OLE_QA::Framework::OLEFS::Receiving_Document.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @rcv.class.should == OLE_QA::Framework::OLEFS::Receiving_Document
    @rcv.class.superclass.should == OLE_QA::Framework::OLEFS::PURAP_Document
  end

  it 'should open a new receiving document via URL' do
    @rcv.open
    @rcv.title.text.strip.should == "Line Item Receiving"
  end

  it 'should have receiving document elements' do
    elements = @rcv.elements
    elements.include?(:date_received_field).should be_true
    elements.include?(:packing_slip_number_field).should be_true
    elements.include?(:bill_of_lading_number_field).should be_true
    elements.include?(:reference_number_field).should be_true
    elements.include?(:carrier_selector).should be_true
  end

  it 'should have a receiving line' do
    @rcv.lines.include?(:receiving_line).should be_true
  end
end