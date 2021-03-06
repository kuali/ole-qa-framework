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

module OLE_QA::Framework::OLEFS
  # An OLE Financial System Requisition
  class Requisition < PURAP_Document
    # Set URL and initialize.
    def initialize(ole_session)
      new_requisition_url = ole_session.url + 'portal.do?channelTitle=Requisition&channelUrl=purapOleRequisition.do?methodToCall=docHandler&command=initiate&docTypeName=OLE_REQS'
      lookup_url          = "purapRequisition.do?methodToCall=docHandler&docId=_DOC_ID_&command=displayDocSearchView#topOfForm"
      super(ole_session, new_requisition_url, lookup_url)
    end

    # Create a new line item object on the requisition.
    def set_lines
      set_line(:line_item, OLE_QA::Framework::OLEFS::Line_Item)
    end

    # Set Requisition screen elements.
    def set_elements
      super
      # Requisition Detail Area
      element(:license_request_checkbox)                          {b.checkbox(:id => "document.licensingRequirementIndicator")}
      element(:receiving_required_checkbox)                       {b.checkbox(:id => "document.receivingDocumentRequiredIndicator")}
      element(:payment_request_approval_required_checkbox)        {b.checkbox(:id => "document.paymentRequestPositiveApprovalIndicator")}
      # Additional Institutional Info Tab
      element(:additional_info_tab_toggle)                        {b.input(:id => "tab-AdditionalInstitutionalInfo-imageToggle")}
      element(:additional_info_phone_number_field)                                {b.text_field(:id => "document.requestorPersonPhoneNumber")}
      # Delivery Tab
      element(:room_field)                                        {b.text_field(:id => "document.deliveryBuildingRoomNumber")}
      element(:building_search_icon)                              {b.input(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[2]/th[1]/following-sibling::td[1]/input[1]")}
      element(:campus_search_icon)                                {b.input(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[1]/th[1]/following-sibling::td[1]/input[1]")}
      element(:delivery_phone_number_field)                       {b.text_field(:id => "document.deliveryToPhoneNumber")}
      # Vendor Tab
      element(:vendor_name_field)                                 {b.text_field(:id => "document.vendorName")}
      element(:vendor_alias_field)                                {b.text_field(:id => 'document.vendorAliasName')}
      element(:select_vendor_button)                              {b.input(:alt => 'select vendor')}
      element(:vendor_search_icon)                                {b.input(:xpath => "//input[@id='document.vendorName']/following-sibling::input[1]")}
      # Titles Tab
      element(:grand_total_field)                                 {b.b(:xpath => "//div[@id='tab-Titles-div']/descendant::th[div[contains(text(),'Grand Total')]]/following-sibling::td/div/b")}
    end
  end
end