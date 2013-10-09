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

describe 'The OLEFS Invoice Line Object base class' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line_object = OLE_QA::Framework::OLEFS::Invoice_Line_Object.new(@ole, 1)
  end

  it 'should create a new instance' do
    @line_object.class.should == OLE_QA::Framework::OLEFS::Invoice_Line_Object
    @line_object.class.superclass.should == OLE_QA::Framework::Common_Object
  end

  it 'should have a line_number accessor method' do
    @line_object.methods.include?(:line_number).should be_true
    @line_object.methods.include?(:line_number=).should be_true
  end

  it 'should have a line_id reader method' do
    @line_object.methods.include?(:line_id).should be_true
    @line_object.methods.include?(:line_id=).should be_false
  end

  it 'should set the line ID equal to the line number minus one' do
    @line_object.line_id.should == 0
    @line_object.line_number = 2
    @line_object.line_id.should == 1
  end
end