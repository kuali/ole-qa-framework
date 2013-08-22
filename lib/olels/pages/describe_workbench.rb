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
  # The OLE Library System Describe Workbench Screen
  class Describe_Workbench < Lookup
    # Set URL
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Describe Workbench&channelUrl='
      url += ole_session.url + 'ole-kr-krad/describeworkbenchcontroller?viewId=DescribeWorkBenchView&methodToCall=start'
      super(ole_session, url)
    end

    # Set OLELS Describe Workbench page elements.
    def set_elements
      super
      # Search Control Elements
      element(:search_button)                   {b.button(:id => "search_button")}
      element(:clear_button)                    {b.button(:id => "clear_button")}
      element(:doc_type_bib)                    {b.radio(:id => 'SearchPanel-docTypeSection_control_0')}
      element(:doc_type_holdings)               {b.radio(:id => 'SearchPanel-docTypeSection_control_1')}
      element(:doc_type_item)                   {b.radio(:id => 'SearchPanel-docTypeSection_control_2')}
      element(:doc_type_e_holdings)             {b.radio(:id => 'SearchPanel-docTypeSection_control_3')}
      element(:link_to_order_button)            {b.button(:id => 'submit_button')}
      element(:export_to_xml_button)            {b.button(:id => 'export_button1')}
      element(:close_button)                    {b.button(:id => 'cancel_button')}
      # Search Fields
      element(:search_field_1)                  {b.text_area(:id => "searchText_id_line0_control")}
      element(:search_which_selector_1)         {b.select_list(:id => "operator_id_line0_control")}
      element(:search_field_selector_1)         {b.select_list(:id => "docField_id_line0_control")}
      element(:search_scope_1_and)              {b.radio(:id => 'searchScope_id_line0_control_0')}
      element(:search_scope_1_or)               {b.radio(:id => 'searchScope_id_line0_control_1')}
      element(:search_scope_1_not)              {b.radio(:id => 'searchScope_id_line0_control_2')}
      element(:search_field_2)                  {b.text_area(:id => 'searchText_id_line1_control')}
      element(:search_which_selector_2)         {b.select_list(:id => 'operator_id_line1_control')}
      element(:search_field_selector_2)         {b.select_list(:id => 'docField_id_line1_control')}
      element(:search_scope_2_and)              {b.radio(:id => 'searchScope_id_line1_control_0')}
      element(:search_scope_2_or)               {b.radio(:id => 'searchScope_id_line1_control_1')}
      element(:search_scope_2_not)              {b.radio(:id => 'searchScope_id_line1_control_2')}
      # Search Results Elements
      element(:next_link)                       {b.a(:text => 'Next')}
      element(:previous_link)                   {b.a(:text => 'Previous')}
    end

    def wait_for_elements
      super
      @wait_on << :search_button
    end
  end
end