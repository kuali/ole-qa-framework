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
  # A single Purchase Order line on an OLE Financial System Invoice E-Document.
  # - This class represents a slight departure from the normal method for creating line objects.
  #   Instead of setting a line number only once, the line object can be redefined to point at
  #   other lines.  This departure represents a more flexible approach and prevents the necessity
  #   of extra recursion to address the multiple sub-objects of an Invoice E-Document.
  # - The future structure of Invoice documents is presently uncertain, so this is a temporary measure.
  #   If necessary, the framework may be restructured to follow this model.
  class PO_Line < OLE_QA::Framework::Common_Object

    # Allow the line number to be dynamically set, as needed for addressing various PO lines on an Invoice.
    attr_accessor :line_number

    # A flexible PO line item object with dynamic ID element definitions on an Invoice document.
    attr_reader :line_item

    # Set OLE instance & line number, instantiate line item for PO line on Invoice document.
    def initialize(ole_session, line_number = 1)
      @line_number = line_number
      super(ole_session)
      @line_item = OLE_QA::Framework::OLELS::Invoice_Line_Item.new(@ole, self, 1)
    end

    # A reader method for the line_id function.
    def line_id
      @line_number - 1
    end

    # Set invoice line elements.
    def set_elements
      super
      element(:po_number)                         {b.span(:id => "process_item_po_doc_line#{line_id}_control")}
      element(:po_end_date)                       {b.text_field(:id => "invoice-poEndDate_line#{line_id}_control")}
      element(:close_po_checkbox)                 {b.checkbox(:id => "CurrentItem_closePO_line#{line_id}_control")}
      element(:delete_po_button)                  {b.button(:id => "CurrentItem_deletePurchaseOrder_line#{line_id}")}
      element(:requisitions_toggle)               {b.a(:id => "po-requisition-view_line#{line_id}_toggle")}
      element(:purchase_orders_toggle)            {b.a(:id => "po-po-view_line#{line_id}_toggle")}
      element(:line_item_receiving_toggle)        {b.a(:id => "po-relatedReceiving-view_line#{line_id}_toggle")}
      element(:correction_receiving_toggle)       {b.a(:id => "po-relatedCorrectionReceiving-view_line#{line_id}_toggle")}
      element(:payment_requests_toggle)           {b.a(:id => "po-relatedPayment-view_line#{line_id}_toggle")}
      element(:credit_memos_toggle)               {b.a(:id => "po-relatedCreditMemo-view_line#{line_id}_toggle")}
      element(:add_button)                        {b.button(:id => "addPOItems_button_line#{line_id}")}
    end

    # Set invoice line functions (for elements with IDs that require numerical inputs).
    def set_functions
      super
    end
  end
end