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

describe 'The Bib Editor' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @browser = @ole.browser
    @bib_editor = OLE_QA::Framework::OLELS::Bib_Editor.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @bib_editor.class.should == OLE_QA::Framework::OLELS::Bib_Editor
    @bib_editor.class.superclass.should == OLE_QA::Framework::OLELS::Editor
  end

  it 'should have bib editor elements' do
    elements = @bib_editor.elements
    elements.include?(:leader_field).should be_true
    elements.include?(:bib_record_status_selector).should be_true
    elements.include?(:set_button).should be_true
    elements.include?(:control_003_link).should be_true
    elements.include?(:control_005_link).should be_true
    elements.include?(:control_006_link).should be_true
    elements.include?(:control_007_link).should be_true
    elements.include?(:control_008_link).should be_true
    elements.include?(:control_009_link).should be_true
    elements.include?(:control_001_field).should be_true
    elements.include?(:control_003_field).should be_true
    elements.include?(:control_005_field).should be_true
    elements.include?(:control_006_format_selector).should be_true
    elements.include?(:control_006_set_button).should be_true
    elements.include?(:control_006_reset_button).should be_true
    elements.include?(:control_007_catmtrl_selector).should be_true
    elements.include?(:control_007_set_button).should be_true
    elements.include?(:control_007_reset_button).should be_true
    elements.include?(:control_008_field).should be_true
  end

  it 'should have bib editor functions' do
    functions = @bib_editor.functions
  end

  it 'should start with one data line added' do
    @bib_editor.data_line_1.class.should == OLE_QA::Framework::OLELS::Data_Line
  end

  it 'should add a data line' do
    @bib_editor.add_data_line(2)
    @bib_editor.methods.include?(:data_line_2).should be_true
    @bib_editor.data_line_2.class.should == OLE_QA::Framework::OLELS::Data_Line
  end

  it 'should delete a data line' do
    @bib_editor.delete_data_line(2)
    @bib_editor.methods.include?(:data_line_2).should be_false
  end

  it 'should not add a data line which already exists' do
    lambda {@bib_editor.add_data_line(1)}.should raise_error
  end

  it 'should not delete a data line which does not exist' do
    lambda {@bib_editor.delete_data_line(2)}.should raise_error
  end

  it 'should start with one 006 line' do
    @bib_editor.control_006_line_1.should be_a(OLE_QA::Framework::OLELS::Control_006_Line)
  end

  it 'should start with one 007 line' do
    @bib_editor.control_007_line.should be_a(OLE_QA::Framework::OLELS::Control_007_Line)
  end

  it 'should add an 006 line' do
    @bib_editor.add_006_line(2)
    @bib_editor.methods.include?(:control_006_line_2).should be_true
    @bib_editor.control_006_line_2.should be_a(OLE_QA::Framework::OLELS::Control_006_Line)
  end

  it 'should add an 007 line' do
    @bib_editor.add_007_line(2)
    @bib_editor.methods.include(:control_007_line_2).should be_true
    @bib_editor.control_007_line.should be_a(OLE_QA::Framework::OLELS::Control_007_Line)
  end

  it 'should delete an 006 line' do
    @bib_editor.remove_006_line(2)
    @bib_editor.methods.should not_include(:control_006_line_2)
  end

  it 'should delete an 007 line' do
    @bib_editor.remove_007_line(2)
    @bib_editor.methods.should not_include(:control_007_line_2)
  end

  it 'should not remove control lines which do not exist' do
    lambda {@bib_editor.remove_006_line(2)}.should raise_error
    lambda {@bib_editor.remove_007_line(2)}.should raise_error
  end
end