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

describe 'An OLEFS Load Summary Lookup page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @page = OLE_QA::Framework::OLEFS::Load_Summary_Lookup.new(@ole)
  end

	after :all do
	  @ole.quit
  end

  it 'should create a new instance' do
    @page.should be_an_instance_of(OLE_QA::Framework::OLEFS::Load_Summary_Lookup)
    @page.class.superclass.should == OLE_QA::Framework::OLEFS::Lookup
  end

  it 'should have load summary lookup elements' do
    elements = @page.elements
    elements.should include(:description_field)
    elements.should include(:filename_field)
    elements.should include(:user_id_field)
    elements.should include(:load_profile_selector)
    elements.should include(:date_from_field)
    elements.should include(:date_to_field)
  end

  it 'should have load summary functions' do
    functions = @page.functions
    functions.should include(:doc_link_by_text)
  end

  it 'should open the load summary lookup screen via URL' do
    @page.open
    @page.title.text.strip.should == 'Load Summary Lookup'
  end
end
