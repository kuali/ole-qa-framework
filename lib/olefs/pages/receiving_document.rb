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

module OLE_QA::Framework::OLEFS
  # An OLE Financial System Receiving Document
  class Receiving_Document < PURAP_Document
    def initialize(ole_session)
      new_receiving_doc_url = ole_session.url + 'portal.do?channelTitle=Receiving&channelUrl=selectOleLineItemReceiving.do?methodToCall=docHandler&command=initiate&docTypeName=OLE_RCVL'
      lookup_url            = "selectOleLineItemReceiving.do?methodToCall=docHandler&docId=_DOC_ID_&command=displayDocSearchView#topOfForm"
      super(ole_session, new_receiving_doc_url, lookup_url)
    end

    # Create a new receiving line object on the receiving document.
    def set_lines
      set_line(:receiving_line,OLE_QA::Framework::OLEFS::Receiving_Line)
    end

    # Set Receiving Doc screen elements.
    def set_elements
      super
      # Vendor Tab
      element(:date_received_field)                               {b.text_field(:id => "document.shipmentReceivedDate")}
      element(:packing_slip_number_field)                         {b.text_field(:id => "document.shipmentPackingSlipNumber")}
      element(:bill_of_lading_number_field)                       {b.text_field(:id => "document.shipmentBillOfLadingNumber")}
      element(:reference_number_field)                            {b.text_field(:id => "document.shipmentReferenceNumber")}
      element(:carrier_selector)                                  {b.select_list(:id => "document.carrierCode")}
    end
  end
end