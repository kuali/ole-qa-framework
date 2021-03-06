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
  # The OLE Library System Staff Upload page, accessible from the OLE Financial System main menu.
  # @note THIS PAGE IS NO LONGER ACTIVE AS OF OLE 1.5 M1 r16954.
  #   Use Batch Process for EOCR uploads instead.
  class Staff_Upload < OLE_QA::Framework::Page

    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Staff%20Upload&channelUrl='
      url += ole_session.url + 'ole-kr-krad/staffuploadcontroller?viewId=StaffUploadView&methodToCall=start'
      super(ole_session, url)
    end

    # Set elements for Staff upload screen.
    def set_elements
      super
      element(:title)                   {browser.h1(:class => 'uif-headerText').span}
      element(:marc_field)              {browser.input(:id => "StaffUploadView-marcFileUpload_control").to_subtype}
      element(:edi_field)               {browser.input(:id => "StaffUploadView-ediFileUpload_control").to_subtype}
      element(:profile_selector)        {browser.select_list(:id => "StaffUploadView-agenda_control")}
      element(:description_field)       {browser.input(:id => "StaffUploadView-agendaDescription_control").to_subtype}
      element(:upload_button)           {browser.button(:id => "uploadButton")}
      element(:cancel_button)           {browser.button(:id => "cancelButton")}
      element(:load_reports_button)     {browser.button(:id => "loadReportsButton")}
      element(:message)                 {browser.div(:id => 'MessageFieldSection').span}
    end

    # Wait for title to appear.
    def wait_for_elements
      @wait_on << :title
      super
    end

    # Add commonly-used functions for staff upload screen.
    def set_functions
      super
      # Clicks the upload button and waits for a message to appear.
      # - Returns the text of the upload message.
      function(:upload)                 {upload_button.click ; wait_for_page_to_load ; message.when_present.text.strip }
    end
  end
end
