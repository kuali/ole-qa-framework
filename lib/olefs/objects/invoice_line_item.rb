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
  # A single Line Item from a Purchase Order, as represented on an OLE Invoice E-Document.
  class Invoice_Line_Item < OLE_QA::Framework::Subline_Object

    def set_elements
      super
      element(:number)                            {b.span(:id => "CurrentItem_LineItemNo_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:open_quantity)                     {b.span(:id => "CurrentItem_openQuantity_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:title)                             {b.div(:id => "CurrentItem_Title_line#{@parent_line.line_id}_line#{line_id}")}
      element(:copies_ordered)                    {b.div(:id => "CurrentItem_NoOfCopiesOrdered_line#{@parent_line.line_id}_line#{line_id}")}
      element(:parts_ordered)                     {b.div(:id => "CurrentItem_NoOfParts_line#{@parent_line.line_id}_line#{line_id}")}
      element(:copies_invoiced_field)             {b.text_field(:id => "CurrentItem_NoOfCopiesInvoice_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:parts_invoiced_field)              {b.text_field(:id => "CurrentItem_NoOfPartsInvoice_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:invoiced_price_field)              {b.text_field(:id => "CurrentItem_ListPrice_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:discount_field)                    {b.text_field(:id => "CurrentItem_Discount_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:discount_type_selector)            {b.select_list(:id => "CurrentItem_DiscountType_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:unit_cost)                         {b.span(:id => "CurrentItem_UnitCost_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:extended_cost)                     {b.span(:id => "CurrentItem_ExtendedCost_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:invoice_checkbox)                  {b.span(:id => "CurrentItem_ItemForInvoice_line#{@parent_line.line_id}_line#{line_id}_control")}
      element(:new_chart_selector)                {b.select_list(:id => "Invoice-chartOfAccountsCode_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_account_number_field)          {b.text_field(:id => "Invoice-accountNumber_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_subaccount_number_field)       {b.text_field(:id => "Invoice-subAccountNumber_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_object_code_field)             {b.text_field(:id => "Invoice-financialObjectCode_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_subobject_code_field)          {b.text_field(:id => "Invoice-financialSubObjectCode_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_project_field)                 {b.text_field(:id => "Invoice-projectCode_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_org_ref_id_field)              {b.text_field(:id => "InvoiceorgRefId_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_dollar_field)                  {b.text_field(:id => "Invoice-amount_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:new_percentage_field)              {b.text_field(:id => "Invoice-percent_line#{@parent_line.line_id}_line#{line_id}_add_control")}
      element(:add_account_button)                {b.button(:id => "OLEInvoiceView-processItems-accountingLines_line#{@parent_line.line_id}_line#{line_id}_add")}
    end

    def set_functions
      super
      # Functions for accounting lines on an Invoice PO Line Item.
      function(:chart_selector)                   { |which = 1| which -= 1; b.select_list(:id => "Invoice-chartOfAccountsCode_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:account_number_field)             { |which = 1| which -= 1; b.text_field(:id => "Invoice-accountNumber_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:subaccount_number_field)          { |which = 1| which -= 1; b.text_field(:id => "Invoice-subAccountNumber_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:object_code_field)                { |which = 1| which -= 1; b.text_field(:id => "Invoice-financialObjectCode_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:subobject_code_field)             { |which = 1| which -= 1; b.text_field(:id => "Invoice-financialSubObjectCode_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:project_field)                    { |which = 1| which -= 1; b.text_field(:id => "Invoice-projectCode_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:org_ref_id_field)                 { |which = 1| which -= 1; b.text_field(:id => "Invoice-orgRefId_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:dollar_field)                     { |which = 1| which -= 1; b.text_field(:id => "Invoice-amount_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:percentage_field)                 { |which = 1| which -= 1; b.text_field(:id => "Invoice-percent_line#{@parent_line.line_id}_line#{line_id}_line#{which}_control")}
      function(:delete_account_button)            { |which = 1| which -= 1; b.button(:id => "OLEInvoiceView-processItems-accountingLines_line#{@parent_line.line_id}_line#{line_id}_del_line#{@parent_line.line_id}_line#{line_id}_line#{which}")}
    end
  end
end