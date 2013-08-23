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

describe 'An OLELS Describe Workbench page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @workbench = OLE_QA::Framework::OLELS::Describe_Workbench.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @workbench.class.should == OLE_QA::Framework::OLELS::Describe_Workbench
    @workbench.class.superclass.should == OLE_QA::Framework::OLELS::Lookup
  end

  it 'should open the describe workbench via URL' do
    @workbench.open
    @workbench.title.text.strip.should == "Describe Workbench"
  end

  it 'should have describe workbench elements' do
    elements = @workbench.methods
    elements.include?(:title).should be_true
    elements.include?(:search_button).should be_true
    elements.include?(:clear_button).should be_true
    elements.include?(:search_field_1).should be_true
    elements.include?(:search_which_selector_1).should be_true
    elements.include?(:search_field_selector_1).should be_true
    elements.should include(:search_scope_1_and)
    elements.should include(:search_scope_1_or)
    elements.should include(:search_scope_1_not)
    elements.should include(:search_field_2)
    elements.should include(:search_which_selector_2)
    elements.should include(:search_field_selector_2)
    elements.should include(:search_scope_2_and)
    elements.should include(:search_scope_2_or)
    elements.should include(:search_scope_2_not)
    elements.should include(:doc_type_bib)
    elements.should include(:doc_type_holdings)
    elements.should include(:doc_type_item)
    elements.should include(:doc_type_e_holdings)
    elements.should include(:export_to_xml_button)
    elements.should include(:link_to_order_button)
    elements.should include(:close_button)
    elements.should include(:previous_link)
    elements.should include(:next_link)
  end

  it 'should have describe workbench functions' do
    functions = @workbench.functions
    functions.should include(:select_by_text)
    functions.should include(:view_by_text)
    functions.should include(:edit_by_text)
    functions.should include(:overlay_by_text)
    functions.should include(:create_instance_by_text)
  end
end
