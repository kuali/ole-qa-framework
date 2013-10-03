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

describe 'An OLE Invoice Line' do

  before :all do
    @ole = OLE_QA::Framework:Session.new
    @invoice_line = OLE_QA::Framework::OLELS::Invoice_Line.new(@ole,1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @invoice_line.class.should == OLE_QA::Framework::OLELS::Invoice_Line
    @invoice_line.class.superclass.should == OLE_QA::Framework::OLELS::Line_Object
  end

  it 'should have invoice line elements' do
    elements = @invoice_line.elements
  end

  it 'should have invoice line functions' do
    functions = @invoice_line.functions
  end

  it 'should have invoice line sublines' do

  end
end