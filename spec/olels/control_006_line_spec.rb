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

describe 'An OLELS Control Field 006 line object' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @line = OLE_QA::Framework::OLELS::Control_006_Line.new(@ole,1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @line.should be_a(OLE_QA::Framework::OLELS::Control_006_Line)
  end

  it 'should have control field 006 line elements' do
    elements = @line.elements
    elements.should include(:field)
    elements.should include(:add_button)
    elements.should include(:edit_button)
    elements.should include(:remove_button)
    elements.should include(:clear_button)
  end
end