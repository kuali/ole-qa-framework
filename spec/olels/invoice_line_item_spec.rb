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
    # Fill in with struct once development begins in earnest.
    @line_item = OLE_QA::Framework::OLELS::Invoice_Line_Item.new(@ole,1)
  end

  it 'should create a new instance' do
    @line_item.class.should == OLE_QA::Framework::OLELS::Invoice_Line_Item
    @line_item.class.superclass.should == OLE_QA::Framework::Common_Object
  end
end