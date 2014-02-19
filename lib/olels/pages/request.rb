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
  # A Request in the OLE Library System.
  class Request < OLE_QA::Framework::Page
    def initialize(ole_session)
      # Direct linking for a new request is not possible, so the URL is for Request_Lookup.
      url = ole_session.url + 'portal.do?channelTitle=Request&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OleDeliverRequestBo&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session,url)
    end

    def set_elements
      super
      element(:title)                                 {b.h1(:class => 'uif-headerText').span(:class => 'uif-headerText-span')}
      element(:document_id)                           {b.div(:data_label => 'Document Number').span(:class => 'uif-readOnlyContent')}
      element(:initiator_id)                          {b.div(:data_label => 'Initiator Network Id').span(:class => 'uif-readOnlyContent')}
      element(:document_status)                       {b.div(:data_label => 'Document Status').span(:class => 'uif-readOnlyContent')}
      element(:creation_timestamp)                    {b.div(:data_label => 'Creation Timestamp').span(:class => 'uif-readOnlyContent')}
      element(:request_details_toggle)                {b.a(:id => 'OleRequestDocument-MaintenanceView-selectRequestBorrower_toggle')}
      element(:user_type_selector)                    {b.select_list(:id => 'selectRequestBorrower-MaintenanceView-requestCreators_control')}
      element(:request_type_selector)                 {b.select_list(:id => 'selectRequestBorrower-MaintenanceView-requestTypeIds_control')}
      element(:patron_barcode_field)                  {b.text_field(:id => 'selectRequestBorrower-MaintenanceView-borrowerBarcodes_control')}
      element(:patron_barcode_icon)                   {b.fieldset(:id => 'selectRequestBorrower-MaintenanceView-borrowerBarcodes_fieldset').input(:class => 'uif-actionImage')}
      element(:patron_name_field)                     {b.text_field(:id => 'selectRequestBorrower-MaintenanceView-borrowerNames_control')}
      element(:submit_button)                         {b.button(:text => /[Ss]ubmit/)}
      element(:save_button)                           {b.button(:text => /[Ss]ave/)}
      element(:back_button)                           {b.button(:text => /[Bb]ack/)}
      element(:cancel_button)                         {b.a(:text => /[Cc]ancel/)}
      element(:error)                                 {b.li(:class => 'uif-errorMessageItem')}
      element(:message)                               {b.li(:class => 'uif-infoMessageItem')}
    end

    def wait_for_elements
      super
      @wait_on << :document_id << :document_status
      @wait_on << :request_details_toggle
    end
  end
end