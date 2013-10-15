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
    elements.include?(:control_006_clear_button).should be_true
    elements.include?(:control_007_catmtrl_selector).should be_true
    elements.include?(:control_007_set_button).should be_true
    elements.include?(:control_007_clear_button).should be_true
    elements.include?(:control_008_field).should be_true
    # Read-Only Elements (non-iterative fields, no input required)
    elements.should include(:readonly_edit_button)
    elements.should include(:readonly_created_by)
    elements.should include(:readonly_created_date)
    elements.should include(:readonly_leader_field)
    elements.should include(:readonly_control_001_field)
    elements.should include(:readonly_control_003_field)
    elements.should include(:readonly_control_005_field)
    elements.should include(:readonly_control_008_field)
  end

  it 'should have bib editor functions' do
    functions = @bib_editor.functions
    # Read-Only Elements (iterative fields, input required to specify which)
    functions.should include(:readonly_control_006_field)
    functions.should include(:readonly_control_007_field)
    functions.should include(:readonly_tag_field)
    functions.should include(:readonly_ind1_field)
    functions.should include(:readonly_ind2_field)
    functions.should include(:readonly_data_field)
  end

  it 'should have bib editor lines' do
    lines = @bib_editor.lines
    lines.include?(:control_006_line).should be_true
    lines.include?(:control_007_line).should be_true
    lines.include?(:data_line).should be_true
    @bib_editor.control_006_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Control_006_Line)
    @bib_editor.control_007_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Control_007_Line)
    @bib_editor.data_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Data_Line)
  end
end