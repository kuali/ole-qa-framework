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

module OLE_QA::Framework::OLELS
  # An address line on an individual patron record.
  class Patron_Address_Line < OLE_QA::Framework::Line_Object
    # Define screen elements for patron record address line.
    def set_elements
      # Format id string based on line_id .
      # @note Address line 0 has no numerical identifier.
      element(:details_link)                      {(line_id == 0) ?
                                                    id_str = 'OlePatronDocument-Address_detLink_add' :
                                                    id_str = "OlePatronDocument-Address_detLink_line#{line_id - 1}"
                                                    b.a(:id => id_str)}
      element(:address_type_selector)             {(line_id == 0) ?
                                                    id_str = 'addressTypeCode_add_control' :
                                                    id_str = "addressTypeCode_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      element(:address_source_selector)           {(line_id == 0) ?
                                                    id_str = 'addressSource_add_control' :
                                                    id_str = "addressSource_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      element(:valid_from_date_field)             {(line_id == 0) ?
                                                    id_str = 'addressValidFrom_add_control' :
                                                    id_str = "addressValidFrom_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:valid_to_date_field)               {(line_id == 0) ?
                                                    id_str = 'addressValidTo_add_control' :
                                                    id_str = "addressValidTo_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:verified_checkbox)                 {(line_id == 0) ?
                                                    id_str = 'addressVerified_add_control' :
                                                    id_str = "addressVerified_line#{line_id - 1}_control"
                                                    b.checkbox(:id => id_str)}
      element(:preferred_checkbox)                {(line_id == 0) ?
                                                    id_str = 'defaultValue_add_control' :
                                                    id_str = "defaultValue_line#{line_id - 1}_control"
                                                    b.checkbox(:id => id_str)}
      element(:active_checkbox)                   {(line_id == 0) ?
                                                    id_str = 'active_add_control' :
                                                    id_str = "active_line#{line_id - 1}_control"
                                                    b.checkbox(:id => id_str)}
      # Details Area
      element(:line_1_field)                      {(line_id == 0) ?
                                                    id_str = 'line1_add_control' :
                                                    id_str = "line1_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:line_2_field)                      {(line_id == 0) ?
                                                    id_str = 'line2_add_control' :
                                                    id_str = "line2_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:line_3_field)                      {(line_id == 0) ?
                                                    id_str = 'line3_add_control' :
                                                    id_str = "line3_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:city_field)                        {(line_id == 0) ?
                                                    id_str = 'city_add_control' :
                                                    id_str = "city_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:state_selector)                    {(line_id == 0) ?
                                                    id_str = 'state_add_control' :
                                                    id_str = "state_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      element(:postal_code_field)                 {(line_id == 0) ?
                                                    id_str = 'postalCode_add_control' :
                                                    id_str = "postalCode_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:country_selector)                  {(line_id == 0) ?
                                                    id_str = 'country_add_control' :
                                                    id_str = "country_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      # Add/Delete
      element(:add_button)                        {b.button(:id => 'OlePatronDocument-Address-Add_add')}
      element(:delete_button)                     {b.button(:id => "OlePatronDocument-Address_del_line#{line_id - 1}")}
    end
  end
end