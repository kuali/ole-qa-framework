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
      element(:user_type_selector)                    {b.select_list(:id => /selectRequest\w+-MaintenanceView-requestCreators_control/)}
      element(:user_id_field)                         {b.text_field(:id => /selectRequest\w+-operatorCreateIds_control/)}
      element(:user_name)                             {b.span(:id => /selectRequest\w+-operatorCreateNames_control/)}
      element(:request_type_selector)                 {b.select_list(:id => /selectRequest\w+-MaintenanceView-requestTypeIds_control/)}
      element(:patron_barcode_field)                  {b.text_field(:id => /selectRequest\w+-MaintenanceView-borrowerBarcodes_control/)}
      element(:patron_barcode_icon)                   {b.fieldset(:id => /selectRequest\w+-MaintenanceView-borrowerBarcodes_fieldset/).input(:class => 'uif-actionImage')}
      element(:patron_name_field)                     {b.text_field(:id => /selectRequest(\w+)?-MaintenanceView-borrowerNames_control/)}
      element(:submit_button)                         {b.button(:text => /[Ss]ubmit/)}
      element(:save_button)                           {b.button(:text => /[Ss]ave/)}
      element(:back_button)                           {b.button(:text => /[Bb]ack/)}
      element(:cancel_button)                         {b.a(:text => /[Cc]ancel/)}
      element(:error)                                 {b.li(:class => 'uif-errorMessageItem')}
      element(:message)                               {b.li(:class => 'uif-infoMessageItem')}
      # The following fields only appear after a request type is selected.
      # (Except request types 'Recall/Delivery Request 1' and 'Recall/Delivery Request 2')
      element(:item_barcode_field)                    {b.text_field(:id => /itemId_control/)}
      element(:item_search_icon)                      {b.fieldset(:id => 'OnholdRequest-itemId_fieldset').input(:class => 'uif-actionImage',:title => 'Search Field')}
      element(:item_barcode_icon)                     {b.fieldset(:id => 'OnholdRequest-itemId_fieldset').input(:class => 'uif-actionImage',:title => 'Search Field')}
      element(:item_title_field)                      {b.text_field(:id => /itemTitle_control/)}
      element(:item_author_field)                     {b.text_field(:id => /author_control/)}
      element(:item_location_field)                   {b.text_field(:id => /shelvingLocation_control/)}
      element(:item_call_number_field)                {b.text_field(:id => /callNumber_control/)}
      element(:item_copy_number_field)                {b.text_field(:id => /copyNumber_control/)}
      element(:patron_queue_position_field)           {b.text_field(:id => /borrowerQueuePosition_control/)}
      element(:create_date_field)                     {b.text_field(:id => /createDate_control/)}
      element(:expiry_date_field)                     {b.text_field(:id => /expirationDate_control/)}
      # (Not present on request types 'Copy Request' or 'In Transit Request')
      element(:pickup_location_selector)              {b.select_list(:id => /pickupLocation_control/)}
      element(:pickup_location_icon)                  {b.fieldset(:id => /pickupLocation_fieldset/).input(:class => 'uif-actionImage', :index => 0)}
      # Request type-specific fields.
      #   Recall
      element(:recall_notice_date)                    {b.div(:id => 'recallRequest-recallNoticeSentDate')}
      #   Hold
      element(:hold_notice_date)                      {b.span(:id => 'onHoldRequest-onHoldNoticeSentDate_control')}
      #   Copy
      element(:copy_format_field)                     {b.text_field(:id => 'copyRequest-copyFormat_control')}
      element(:copy_pages_field)                      {b.text_field(:id => 'copyRequest-contentDescription_control')}
      #   In-Transit
      element(:circulation_location_selector)         {b.select_list(:id => 'inTransitRequest-circulationLocationId_control')}
      element(:checkin_note_field)                    {b.text_field(:id => 'inTransitRequest-checkInNote_control')}
    end

    def wait_for_elements
      super
      @wait_on << :document_id << :document_status
      @wait_on << :request_details_toggle
    end
  end
end