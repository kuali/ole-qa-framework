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

describe 'My behaviour' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line_1 = OLE_QA::Framework::OLELS::Patron_Phone_Line.new(@ole,1)
    @line_2 = OLE_QA::Framework::OLELS::Patron_Phone_Line.new(@ole,2)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @line_1.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Phone_Line)
    @line_2.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Phone_Line)
    @line_1.class.superclass.should == OLE_QA::Framework::OLELS::Line_Object
  end

  it 'should have patron phone line elements' do
    elements = @line_1.elements
    elements.should include(:phone_type_selector)
    elements.should include(:phone_number_field)
    elements.should include(:extension_field)
    elements.should include(:country_selector)
    elements.should include(:preferred_checkbox)
    elements.should include(:active_checkbox)
    elements.should include(:add_button)
    elements.should include(:delete_button)
  end
end