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

describe 'An OLEFS Payment Request page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @browser = @ole.browser
    @preq = OLE_QA::Framework::OLEFS::Payment_Request.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @preq.class.should ==  OLE_QA::Framework::OLEFS::Payment_Request
    @preq.class.superclass.should == OLE_QA::Framework::OLEFS::PURAP_Document
  end

  it 'should open a new PREQ document via URL' do
    @preq.open
    @preq.title.text.strip.should == "Payment Request"
  end

  it 'should have payment request elements' do
    elements = @preq.elements
  end
end