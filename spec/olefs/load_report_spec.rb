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
    @page = OLE_QA::Framework::OLEFS::Load_Report.new(@ole)
  end

  it 'should create a new instance' do
    @page.should be_an_instance_of(OLE_QA::Framework::OLEFS::Load_Report)
    @page.class.superclass.should == OLE_QA::Framework::OLEFS::E_Doc
  end

  it 'should have load report elements' do
    elements = @page.elements
    elements.should include(:profile_name)
    elements.should include(:user_id)
    elements.should include(:counts)
    elements.should include(:file_name)
    elements.should include(:number_of_pos)
    elements.should include(:number_of_bibs)
    elements.should include(:po_link)
    elements.should include(:bib_link)
    elements.should include(:upload_description)
    elements.should include(:upload_date)
  end

  it 'should have load report functions' do
    functions = @page.functions
    functions.should include(:total_count)
    functions.should include(:success_count)
    functions.should include(:failure_count)
    functions.should include(:upload_date_ymd)
    functions.should include(:upload_date_tod)
  end
end