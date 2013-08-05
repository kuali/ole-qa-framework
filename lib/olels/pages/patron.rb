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

module OLE_QA::Framework::OLELS
  # A single patron record in the OLE Library System.
  # @note Use of this page may require a special login.  The default user,
  #   ole-khuntley, does not have sufficient permissions to create a new
  #   patron record (as of 1.0.0-M2-r13397, 07/31/2013).
  class Patron < E_Doc
    # The page object will open a new patron record by default.
    def initialize(ole_session)
      url = ole_session.url + 'ole-kr-krad/patronMaintenance?viewTypeName=MAINTENANCE&returnLocation='
      url += ole_session.url + 'portal.do&methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OlePatronDocument'
      super(ole_session, url)

      # Set up initial contact info lines, one of each.
      add_address_line(1)
      add_phone_line(1)
      add_email_line(1)
    end

    # Define screen elements for patron record screen.
    def set_elements
      super
      element(:patron_id)                                     {b.a(:xpath => "//th[span/label[contains(text(),'Patron Id:')]]/following-sibling::td[1]/div/span/a")}
      element(:barcode_field)                                 {b.text_field(:id => 'barcode_control')}
      element(:borrower_type_selector)                        {b.select_list(:id => 'borrowerType_control')}
      element(:source_selector)                               {b.select_list(:id => 'sourceType_control')}
      element(:patron_image_field)                            {b.input(:id => 'attachment_Files_control').to_subtype}
      element(:upload_image_button)                           {b.button(:id => 'uploadButton_patron')}
      element(:statistical_category_selector)                 {b.select_list(:id => 'statisticalCategory_control')}
      element(:activation_date_field)                         {b.text_field(:id => 'activationDate_control')}
      element(:expiration_date_field)                         {b.text_field(:id => 'expirationDate_control')}
      element(:active_checkbox)                               {b.checkbox(:id => 'activeIndicator_control')}
      element(:name_type)                                     {b.span(:id => /nameType.*control/)}
      element(:title_selector)                                {b.select_list(:id => /namePrefix.*control/)}
      element(:first_name_field)                              {b.text_field(:id => /firstName.*control/)}
      element(:middle_name_field)                             {b.text_field(:id => /middleName.*control/)}
      element(:last_name_field)                               {b.text_field(:id => /lastName.*control/)}
      element(:suffix_selector)                               {b.select_list(:id => /nameSuffix.*control/)}
      element(:affiliation_toggle)                            {b.a(:id => 'OlePatronDocument-Affiliation_toggle')}
      element(:library_policies_toggle)                       {b.a(:id => 'OlePatronDocument-LibraryPoliciesSection_toggle')}
      element(:loaned_records_toggle)                         {b.a(:id => 'OlePatronDocument-PatronLoanedRecords_toggle')}
      element(:requested_records_toggle)                      {b.a(:id => 'OlePatronDocument-PatronRequestedRecords_toggle')}
      element(:temp_circ_history_toggle)                      {b.a(:id => 'OlePatronDocument-TemporaryCirculationHistoryRecords_toggle')}
      element(:note_toggle)                                   {b.a(:id => 'OlePatronDocument-NotesSection_toggle')}
      element(:proxy_patron_toggle)                           {b.a(:id => 'OlePatronDocument-ProxySection_toggle')}
      element(:proxy_for_toggle)                              {b.a(:id => 'OlePatronDocument-ProxyForSection_toggle')}
      element(:local_id_toggle)                               {b.a(:id => 'OlePatronDocument-PatronLocalIdSection_toggle')}
      element(:lost_barcode_toggle)                           {b.a(:id => 'OlePatronDocument-InvalidOrLostBarcodeSection_toggle')}
      # TODO Check on OLE-4523 for the establishment of the element ID in the ad_hoc_toggle link.
      element(:ad_hoc_toggle)                                 {b.a(:id => 'OlePatronDocument-AdHocRecipientsSection_toggle')}
      # TODO Check on OLE-4526 for the establishment of the element ID in the route_log_toggle link.
      element(:route_log_toggle)                              {b.a(:id => 'OlePatronDocument-RouteLogSection_toggle')}
      element(:contacts_toggle)                               {b.a(:id => 'OlePatronDocument-ContactsSection_toggle')}
      element(:overview_toggle)                               {b.a(:id => 'OlePatronDocument-OverviewSection_toggle')}
      element(:name_toggle)                                   {b.a(:id => 'OlePatronDocument-Name_toggle')}
      element(:address_toggle)                                {b.a(:id => 'OlePatronDocument-Address_toggle')}
      element(:phone_toggle)                                  {b.a(:id => 'OlePatronDocument-Phone_toggle')}
      element(:email_toggle)                                  {b.a(:id => 'OlePatronDocument-Email_toggle')}
    end

    # Define commonly used functions for patron record screen.
    def set_functions
      super
      # If the .patron_image_field has already been set once, IDs of related elements change.
      # Use this method to update element IDs on the page object.  It will return true if the IDs have been updated, false if the default IDs are still being used.
      function(:redefine_patron_image_elements)               do
                                                                if b.input(:id => 'attachment_File_edit_control').present?
                                                                  set_element(:patron_image_field, true)  {b.input(:id => 'attachment_File_edit_control').to_subtype}
                                                                  set_element(:upload_image_button,true)  {b.button(:id => 'uploadButton_edit')}
                                                                  true
                                                                else
                                                                  set_element(:patron_image_field, true)  {b.input(:id => 'attachment_Files_control').to_subtype}
                                                                  set_element(:upload_image_button, true) {b.button(:id => 'uploadButton_patron')}
                                                                  false
                                                                end
                                                              end
    end

    def create_address_line(which = 1)
      create_line("address_line_#{which}","Patron_Address_Line", which)
    end
    alias_method(:add_address_line, :create_address_line)

    def create_phone_line(which = 1)
      create_line("phone_line_#{which}","Patron_Phone_Line", which)
    end
    alias_method(:add_phone_line, :create_phone_line)

    def create_email_line(which = 1)
      create_line("email_line_#{which}","Patron_Email_Line", which)
    end
    alias_method(:add_email_line, :create_email_line)

    def remove_address_line(which = 1)
      remove_line("address_line_#{which}")
    end
    alias_method(:delete_address_line, :remove_address_line)

    def remove_phone_line(which = 1)
      remove_line("phone_line_#{which}")
    end
    alias_method(:delete_phone_line, :remove_phone_line)

    def remove_email_line(which = 1)
      remove_line("email_line_#{which}")
    end
    alias_method(:delete_email_line, :remove_email_line)
  end
end