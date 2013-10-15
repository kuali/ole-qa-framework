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

describe 'A patron record page' do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @page = OLE_QA::Framework::OLELS::Patron.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it 'should create a new instance' do
    @page.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron)
    @page.class.superclass.should == OLE_QA::Framework::OLELS::E_Doc
  end

  it 'should have patron elements' do
    elements = @page.elements
    elements.should include(:patron_id)
    elements.should include(:barcode_field)
    elements.should include(:borrower_type_selector)
    elements.should include(:source_selector)
    elements.should include(:patron_image_field)
    elements.should include(:upload_image_button)
    elements.should include(:statistical_category_selector)
    elements.should include(:activation_date_field)
    elements.should include(:expiration_date_field)
    elements.should include(:active_checkbox)
    elements.should include(:name_type)
    elements.should include(:title_selector)
    elements.should include(:first_name_field)
    elements.should include(:last_name_field)
    elements.should include(:middle_name_field)
    elements.should include(:suffix_selector)
    elements.should include(:affiliation_toggle)
    elements.should include(:library_policies_toggle)
    elements.should include(:loaned_records_toggle)
    elements.should include(:requested_records_toggle)
    elements.should include(:temp_circ_history_toggle)
    elements.should include(:note_toggle)
    elements.should include(:proxy_patron_toggle)
    elements.should include(:proxy_for_toggle)
    elements.should include(:local_id_toggle)
    elements.should include(:lost_barcode_toggle)
    elements.should include(:ad_hoc_toggle)
    elements.should include(:route_log_toggle)
    elements.should include(:contacts_toggle)
    elements.should include(:overview_toggle)
    elements.should include(:name_toggle)
    elements.should include(:address_toggle)
    elements.should include(:phone_toggle)
    elements.should include(:email_toggle)
  end

  it 'should have patron functions' do
    functions = @page.functions
    functions.should include(:redefine_patron_image_elements)
  end

  it 'should have patron contact info lines' do
    lines = @page.lines
    lines.include?(:address_line).should be_true
    lines.include?(:phone_line).should be_true
    lines.include?(:email_line).should be_true
    @page.address_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Address_Line)
    @page.phone_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Phone_Line)
    @page.email_line.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Email_Line)
  end

  it 'should open the page via URL' do
    @ole.open
    @page.login('admin').should be_true
    @page.open
    @page.title.when_present.text.strip.should == 'Patron'
  end
end