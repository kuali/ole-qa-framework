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

describe 'The Page Helpers module' do

  before :all do
    @ole = OLE_QA::Framework::Session.new

    class TestPage < OLE_QA::Framework::Page
      def set_lines
        set_line(:line_object, OLE_QA::Framework::Line_Object)
      end
    end

    @test_page = TestPage.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a page instance with a line object already declared' do
    @test_page.methods.include?(:line_object).should be_true
    @test_page.line_object.class.should == OLE_QA::Framework::Line_Object
  end

  it 'should have the line object listed in the lines accessor' do
    @test_page.lines.include?(:line_object).should be_true
  end

  it 'should define a line object dynamically' do
    @test_page.set_line(:addl_line_object, OLE_QA::Framework::Line_Object)
    @test_page.lines.include?(:addl_line_object).should be_true
    @test_page.addl_line_object.should be_an_instance_of(OLE_QA::Framework::Line_Object)
  end

  it 'should not set a line object which has already been defined' do
    lambda {@test_page.set_line(:addl_line_object)}.should raise_error
  end
end