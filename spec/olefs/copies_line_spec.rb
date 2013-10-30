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

describe 'A copies line' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @copies_line = OLE_QA::Framework::OLEFS::Copies_Line.new(@ole, 1)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @copies_line.class.should == OLE_QA::Framework::OLEFS::Copies_Line
  end

  it 'should be a subclass of subline object' do
    @copies_line.class.superclass.should == OLE_QA::Framework::Subline_Object
  end

  it 'should have a browser accessor' do
    @copies_line.browser.class.should == @ole.browser.class
  end

  it 'should have line number methods' do
    @copies_line.line_number.should == 1
  end

  it 'should have copies line elements' do
    elements = @copies_line.elements
    elements.include?(:location_copies_selector).should be_true
    elements.include?(:copies).should be_true
    elements.include?(:parts).should be_true
    elements.include?(:starting_copy_field).should be_true
    elements.include?(:caption_field).should be_true
    elements.include?(:volume_number_field).should be_true
    elements.include?(:delete_button).should be_true
  end
end