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
  # An OLE Financial System PURchasing/Accounts Payable Document
  class PURAP_Document < E_Doc

    # Set PURAP Document Elements.
    def set_elements
      super
      # View Related Documents Tab
      element(:view_related_tab_toggle)                           {b.input(:id => "tab-ViewRelatedDocuments-imageToggle")}
      element(:view_related_po_link)                              {b.a(:xpath => "//div[@id='tab-ViewRelatedDocuments-div']/descendant::h3[contains(text(),'Purchase Order')]/a")}
      element(:view_related_requisition_link)                     {b.a(:xpath => "//div[@id='tab-ViewRelatedDocuments-div']/descendant::h3[contains(text(),'Requisition')]/a")}
      # Delivery Tab
      element(:delivery_tab_toggle)                               {b.input(:id => "tab-Delivery-imageToggle")}
      element(:building_field)                                    {b.td(:xpath => "//div[@id='tab-Delivery-div']/div/table/tbody/tr[2]/td[1]")}
      element(:campus_field)                                      {b.td(:xpath => "//div[@id='tab-Delivery-div']/div/table/tbody/tr[1]/td[1]")}
      element(:closed_room_field)                                 {b.td(:xpath => "//div[@id='tab-Delivery-div']/div/table/tbody/tr[5]/td[1]")}
      element(:closed_building_field)                             {b.td(:xpath => "//div[@id='tab-Delivery-div']/div/table/tbody/tr[2]/td[1]")}
      element(:closed_campus_field)                               {b.td(:xpath => "//div[@id='tab-Delivery-div']/div/table/tbody/tr[1]/td[1]")}
      element(:closed_address_1_field)                            {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[3]/th[1]/following-sibling::td[1]")}
      element(:closed_address_2_field)                            {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[4]/th[1]/following-sibling::td[1]")}
      element(:closed_city_field)                                 {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[6]/th[1]/following-sibling::td[1]")}
      element(:closed_state_field)                                {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[7]/th[1]/following-sibling::td[1]")}
      element(:closed_postal_code_field)                          {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[8]/th[1]/following-sibling::td[1]")}
      element(:closed_country_field)                              {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[9]/th[1]/following-sibling::td[1]")}
      element(:closed_delivery_to_field)                          {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[1]/th[1]/following-sibling::td[2]")}
      element(:closed_delivery_phone_number_field)                {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[2]/th[1]/following-sibling::td[2]")}
      element(:closed_email_field)                                {b.td(:xpath => "//div[@id='tab-Delivery-div']/descendant::tr[3]/th[1]/following-sibling::td[2]")}
      # Vendor Tab
      element(:vendor_tab_toggle)                                 {b.input(:id => "tab-Vendor-imageToggle")}
      element(:closed_vendor_name_field)                          {b.td(:xpath => "//tr/th[div[contains(text(),'Suggested Vendor:')]]/following-sibling::td[1]")}
      # Route Log Tab
      element(:route_log_tab_toggle)                              {b.input(:id => "tab-RouteLog-imageToggle")}
      # New Purchasing Line Item Elements
      element(:new_bib_option)                                    {b.radio(:name => 'AttachBib', :index => 0)}
      element(:existing_bib_option)                               {b.radio(:name => 'AttachBib', :index => 1)}
      element(:existing_bib_button)                               {b.input(:id => 'bibSelectExistingItemButton')}
      element(:new_bib_button)                                    {b.input(:id => "bibCreateCurrentItemButton")}
      element(:item_type_selector)                                {b.select_list(:id => "newPurchasingItemLine.itemTypeDescription")}
      element(:copies_field)                                      {b.text_field(:id => "newPurchasingItemLine.oleItemQuantity")}
      element(:parts_field)                                       {b.text_field(:id => "newPurchasingItemLine.itemNoOfParts")}
      element(:list_price_field)                                  {b.text_field(:id => "newPurchasingItemLine.itemListPrice")}
      element(:public_view_checkbox)                              {b.checkbox(:id => "newPurchasingItemLine.itemPublicViewIndicator")}
      element(:item_price_source_selector)                        {b.select_list(:id => "newPurchasingItemLine.itemPriceSourceId")}
      element(:request_source_selector)                           {b.select_list(:id => "newPurchasingItemLine.requestSourceTypeId")}
      element(:format_selector)                                   {b.select_list(:id => "newPurchasingItemLine.formatTypeId")}
      element(:category_selector)                                 {b.select_list(:id => "newPurchasingItemLine.categoryId")}
      element(:route_to_requestor_checkbox)                       {b.checkbox(:id => "newPurchasingItemLine.itemRouteToRequestorIndicator")}
      element(:discount_field)                                    {b.text_field(:id => "newPurchasingItemLine.itemDiscount")}
      element(:discount_type_selector)                            {b.select_list(:id => "newPurchasingItemLine.itemDiscountType")}
      element(:add_button)                                        {b.input(:name => "methodToCall.addItem")}
      element(:location_selector)                                 {b.select_list(:id => 'newPurchasingItemLine.itemLocation')}
    end
  end
end