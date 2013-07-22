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

describe 'An OLELS Staff Upload page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @page = OLE_QA::Framework::OLELS::Staff_Upload.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @page.should be_an_instance_of(OLE_QA::Framework::OLELS::Staff_Upload)
    @page.class.superclass.should == OLE_QA::Framework::Page
  end

  it 'should have staff upload elements' do
    elements = @page.elements
    elements.should include(:title)
    elements.should include(:marc_field)
    elements.should include(:edi_field)
    elements.should include(:profile_selector)
    elements.should include(:description_field)
    elements.should include(:upload_button)
    elements.should include(:cancel_button)
    elements.should include(:load_reports_button)
  end

  it 'should open the staff upload screen via URL' do
    @page.open
    @page.title.text.strip.should == 'Staff Upload'
  end
end