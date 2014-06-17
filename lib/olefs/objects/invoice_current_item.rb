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
  # A Current Items line on an OLE Financial System Invoice e-document.
  class Invoice_Current_Item < OLE_QA::Framework::Line_Object

    def set_elements
      super
      element(:po_number)                           {b.div(:id => "invoiceItem_poDoc_num_item_line#{line_id}")}
      element(:open_quantity)                       {b.div(:id => "invoiceItem_olePoOutstandingQuantity_line#{line_id}")}
      element(:title)                               {b.div(:id => "invoiceItem_itemDescription_line#{line_id}")}
      element(:po_price)                            {b.span(:id => "invoiceItem_purchaseoOrderItemUnitPrice_line#{line_id}_control")}
      element(:copies_invoiced_field)               {b.text_field(:id => "invoiceItem_oleItemQuantity_line#{line_id}_control")}
      element(:invoiced_price_field)                {b.text_field(:id => "invoiceItem_itemListPrice_line#{line_id}_control")}
      element(:discount_field)                      {b.text_field(:id => "invoiceItem_itemDiscount_line#{line_id}_control")}
      element(:discount_type_selector)              {b.select_list(:id => "invoiceItem_itemDiscountType_line#{line_id}_control")}
      element(:unit_cost)                           {b.span(:id => "invoiceItem_itemUnitPrice_line#{line_id}_control")}
      element(:extended_cost)                       {b.span(:id => "invoiceItem_extendedPrice_line#{line_id}_control")}
      element(:total_cost)                          {b.span(:id => "invoiceItem_totalAmount_line#{line_id}_control")}
    end
  end
end