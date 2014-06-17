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

module OLE_QA::Framework::OLELS
  # The view/edit page for Location in the OLE Library System
  class Location < OLE_QA::Framework::OLELS::E_Doc
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Location &channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.describe.bo.OleLocation&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:document_id, true)                                         {b.span(:id => 'Uif-OleDocumentNumber_control')}
      element(:initiator_id, true)                                        {b.span(:id => 'Uif-OleDocumentInitiatorNetworkId_control')}
      element(:document_status, true)                                     {b.span(:id => 'Uif-OleDocumentStatus_control')}
      element(:creation_timestamp, true)                                  {b.span(:id => 'Uif-OleDocumentCreateDate_control')}
      element(:error_message)                                             {b.ul(:id => 'pageValidationList').li(:class => 'uif-errorMessageItem')}
      element(:message)                                                   {b.ul(:id => 'pageValidationList').li(:class => 'uif-infoMessageItem')}
      element(:location_code_field)                                       {b.text_field(:id => 'create_locationCode_control')}
      element(:location_name_field)                                       {b.text_field(:id => 'create_locationName_control')}
      element(:location_level_field)                                      {b.text_field(:id => 'create_levelId_control')}
      element(:location_level_icon)                                       {b.input(:title => 'Search Field', :index => 0)}
      element(:parent_location_selector)                                  {b.select_list(:id => 'create_parentLocationId_control')}
      element(:parent_location_icon)                                      {b.input(:title => 'Search Field', :index => 1)}
      element(:submit_button)                                             {b.button(:id => 'oleSubmit')}
      element(:save_button)                                               {b.button(:id => 'usave')}
      element(:blanket_approve_button)                                    {b.button(:id => 'oleBlanketApprove')}
      element(:back_button)                                               {b.button(:id => 'oleClose')}
      element(:close_button)                                              {back_button}
      element(:cancel_link)                                               {b.a(:id => 'ucancel')}
    end

    def set_functions
      super
      # Submit the document, and when the outcome message is present, check for success.
      function(:submit)                                                   { submit_button.when_present.click
          wait_for_page_to_load
          Watir::Wait.until { message.present? || error_message.present? }
          message.present? && message.text.include?('successfully submitted') ? true : false }
    end

    def wait_for_elements
      super
      @wait_on << :location_code_field
      @wait_on << :parent_location_selector
    end
  end
end