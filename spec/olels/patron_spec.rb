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
    elements.should include(:patron_id_link)
    elements.should include(:barcode_field)
    elements.should include(:borrower_type_selector)
    elements.should include(:source_selector)
    elements.should include(:browse_image_button)
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
  end

  it 'should have contact info lines' do
    all_methods = @page.methods
    all_methods.should include(:address_line_1)
    all_methods.should include(:phone_line_1)
    all_methods.should include(:email_line_1)
    all_methods.should include(:add_address_line)
    all_methods.should include(:add_phone_line)
    all_methods.should include(:add_email_line)
    all_methods.should include(:remove_address_line)
    all_methods.should include(:remove_phone_line)
    all_methods.should include(:remove_email_line)
  end

  it 'should add contact info lines' do
    @page.add_address_line(2)
    @page.add_phone_line(2)
    @page.add_email_line(2)
    methods = @page.methods
    methods.should include(:address_line_2)
    methods.should include(:phone_line_2)
    methods.should include(:email_line_2)
    @page.address_line_2.should be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Address_Line)
    @page.phone_line_2.should   be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Phone_Line)
    @page.email_line_2.should   be_an_instance_of(OLE_QA::Framework::OLELS::Patron_Email_Line)
  end

  it 'should remove contact info lines' do
    @page.remove_address_line(2)
    @page.remove_phone_line(2)
    @page.remove_email_line(2)
    methods = @page.methods
    methods.should_not include(:address_line_2)
    methods.should_not include(:phone_line_2)
    methods.should_not include(:email_line_2)
  end

  it 'should not remove contact info lines which do not exist' do
    lambda {@page.remove_address_line(2)}.should  raise_error
    lambda {@page.remove_phone_line(2)}.should    raise_error
    lambda {@page.remove_email_line(2)}.should    raise_error
  end

  it 'should open the page via URL' do
    @page.open
    @page.title.text.strip.should == 'Patron'
  end
end