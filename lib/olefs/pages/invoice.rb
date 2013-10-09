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
  # An OLE Library System invoice document.
  class Invoice < OLE_QA::Framework::OLELS::E_Doc

    # A flexible object representing a Purchase Order line on an Invoice document.
    attr_reader :po_line

    # A flexible object representing a Purchase Order line item in the Current Items tab of an Invoice document.
    attr_reader :current_items_line

    # Initialize with URL for a new invoice.
    def initialize(ole_session)
      url = ole_session.url + '/portal.do?channelTitle=Create&channelUrl='
      url += ole_session.url + '/ole-kr-krad/OLEInvoice?viewId=OLEInvoiceDocumentView&methodToCall=docHandler&command=initiate&documentClass=org.kuali.ole.krad.transaction.documents.OLEInvoiceDocument'
      super(ole_session, url)
      @po_line = OLE_QA::Framework::OLEFS::Invoice_Line.new(@ole, 1)
      @current_items_line = OLE_QA::Framework::OLEFS::Invoice_Current_Item.new(@ole, 1)
    end

    # Define basic invoice document screen elements.
    def set_elements
      super
      element(:document_type_id)                      {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Invoice #:')]]/following-sibling::td[1]/div/span")}
      element(:document_type_status)                  {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Invoice Doc Status:')]]/following-sibling::td[1]/div/span")}
      element(:fiscal_year)                           {b.span(:id => 'invoice-documentYear_control')}
      element(:total_amount)                          {b.span(:id => 'invoice-documentTotalAmount_control')}
      element(:vendor_selector)                       {b.select_list(:id => 'invoice-vendorHeaderIdentifier_control')}
      element(:vendor_invoice_num_field)              {b.text_field(:id => 'invoice-invoiceNumber_control')}
      element(:payment_class_field)                   {b.text_field(:id => 'invoice-invoicePaymentClassification_control')}
      element(:vendor_invoice_amt_field)              {b.text_field(:id => 'invoice-invoiceVendorAmount_control')}
      element(:invoice_type_selector)                 {b.select_list(:id => 'invoice-invoiceTypeId_control')}
      element(:bank_code_field)                       {b.text_field(:id => 'invoice-invoiceBankCode_control')}
      element(:pay_date_field)                        {b.text_field(:id => 'invoice-invoicePayDate_control')}
      element(:immediate_pay_checkbox)                {b.checkbox(:id => 'invoice-invoicePayDateCheck_control')}
      element(:invoice_date_field)                    {b.text_field(:id => 'invoice-invoiceDate_control')}
      element(:pay_attachment_checkbox)               {b.checkbox(:id => 'paymentAttachmentIndicator_control')}
      element(:invoice_subtype_selector)              {b.select_list(:id => 'invoice-invoiceSubTypeId_control')}
      element(:payment_method_selector)               {b.select_list(:id => 'invoice-paymentMethod_control')}
      element(:po_number_field)                       {b.text_field(:id => 'OleInvoice_POLookup_control')}
      element(:po_add_button)                         {b.button(:id => 'addProcessItem-button')}
      element(:freight_cost_field)                    {b.text_field(:id => 'additionalItem_extendedCost_line0_control')}
      element(:freight_description_field)             {b.text_field(:id => 'additionalItem_itemDesc_line0_control')}
      element(:shipping_cost_field)                   {b.text_field(:id => 'additionalItem_extendedCost_line1_control')}
      element(:shipping_description_field)            {b.text_field(:id => 'additionalItem_itemDesc_line1_control')}
      element(:min_order_cost_field)                  {b.text_field(:id => 'additionalItem_extendedCost_line2_control')}
      element(:min_order_description_field)           {b.text_field(:id => 'additionalItem_itemDesc_line2_control')}
      element(:misc_cost_field)                       {b.text_field(:id => 'additionalItem_extendedCost_line3_control')}
      element(:misc_description_field)                {b.text_field(:id => 'additionalItem_itemDesc_line3_control')}
      element(:prorate_price_checkbox)                {b.checkbox(:id => 'myAccount_prorateByDollar_control')}
      element(:prorate_qty_checkbox)                  {b.checkbox(:id => 'myAccount_prorateByQuantity_control')}
      element(:prorate_manual_checkbox)               {b.checkbox(:id => 'myAccount_prorateByManual_control')}
      element(:no_prorate_checkbox)                   {b.checkbox(:id => 'myAccount_noProrate_control')}
      element(:prior_total_field)                     {b.text_field(:id => 'invoiceTotal_control')}
      element(:grand_total)                           {b.span(:id => 'myAccount_grandTotal_control')}
      element(:submit_button)                         {b.button(:text => /submit/)}
      element(:save_button)                           {b.button(:id => 'usave')}
      element(:approve_button)                        {b.button(:text => /blanket approve/)}
      element(:close_button)                          {b.button(:id => 'uclose')}
      element(:cancel_button)                         {b.a(:id => 'ucancel')}
      element(:calculate_button)                      {b.button(:text => /calculate/)}
    end

    # Wait on these elements before the page is considered to have fully loaded.
    def wait_for_elements
      super
      # @wait_on << :element
    end

    def set_functions
      super

    end
  end
end