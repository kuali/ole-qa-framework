#  Copyright 2005-2014 The Kuali Foundation
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


describe 'A Line Object' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    class TestLine < OLE_QA::Framework::Line_Object
      def set_sublines
        subline(:test_subline, OLE_QA::Framework::Subline_Object)
      end
    end
    @line_object = TestLine.new(@ole, 1)
  end

  after :all do
    @ole.quit unless @ole.nil?
  end

  it 'should create a new instance of line object' do
    @line_object.class.superclass.should == OLE_QA::Framework::Line_Object
  end

  it 'should have a browser accessor' do
    @line_object.browser.class.should == @ole.browser.class
  end

  it 'should have a line number' do
    @line_object.line_number.should == 1
  end

  it 'should have a line ID' do
    @line_object.line_id.should == 0
  end

  it 'should allow the line number to be set dynamically' do
    @line_object.line_number = 2
    @line_object.line_number.should == 2
  end

  it 'should redefine the line ID to one less than the line number' do
    @line_object.line_id.should == 1
  end

  it 'should start with a test subline defined automagically' do
    @line_object.methods.include?(:test_subline).should be_true
    @line_object.test_subline.should be_an_instance_of(OLE_QA::Framework::Subline_Object)
  end

  it 'should have that subline listed in the sublines reader attribute' do
    @line_object.sublines.include?(:test_subline).should be_true
  end

  it 'should allow a subline to be set dynamically' do
    @line_object.set_subline(:test_subline_2, OLE_QA::Framework::Subline_Object)
    @line_object.methods.include?(:test_subline_2).should be_true
    @line_object.test_subline_2.should be_an_instance_of(OLE_QA::Framework::Subline_Object)
  end

  it 'should add that subline object to the sublines reader attribute' do
    @line_object.sublines.include?(:test_subline_2).should be_true
  end

  it 'should not define a subline object which already exists' do
    lambda {@line_object.set_subline(:test_subline)}.should raise_error
  end
end