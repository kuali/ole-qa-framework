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

describe 'A patron address line' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line_1 = OLE_QA::Framework::OLELS::Patron_Address_Line.new(@ole, 1)
    @line_2 = OLE_QA::Framework::OLELS::Patron_Address_Line.new(@ole, 2)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @line_1.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Address_Line)
    @line_1.class.superclass.should == OLE_QA::Framework::Line_Object
  end

  it 'should have address line elements' do
    elements = @line_1.elements
    elements.should include(:details_link)
    elements.should include(:address_type_selector)
    elements.should include(:address_source_selector)
    elements.should include(:valid_from_date_field)
    elements.should include(:valid_to_date_field)
    elements.should include(:verified_checkbox)
    elements.should include(:preferred_checkbox)
    elements.should include(:active_checkbox)
    elements.should include(:line_1_field)
    elements.should include(:line_2_field)
    elements.should include(:line_3_field)
    elements.should include(:city_field)
    elements.should include(:state_selector)
    elements.should include(:postal_code_field)
    elements.should include(:country_selector)
    elements.should include(:add_button)
    elements.should include(:delete_button)
  end
end