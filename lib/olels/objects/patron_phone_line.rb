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
  # A phone number info line on a single patron record.
  class Patron_Phone_Line < Line_Object
    # Set screen elements for patron phone number info line.
    def set_elements
      element(:phone_type_selector)               {(line_id == 0) ?
                                                    id_str = 'phoneTypeCode_add_control' :
                                                    id_str = "phoneTypeCode_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      element(:phone_number_field)                {(line_id == 0) ?
                                                    id_str = 'phoneNumber_add_control' :
                                                    id_str = "phoneNumber_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:extension_field)                   {(line_id == 0) ?
                                                    id_str = 'extensionNumber_add_control' :
                                                    id_str = "extensionNumber_line#{line_id - 1}_control"
                                                    b.text_field(:id => id_str)}
      element(:country_selector)                  {(line_id == 0) ?
                                                    id_str = 'countryCode_add_control' :
                                                    id_str = "countryCode_line#{line_id - 1}_control"
                                                    b.select_list(:id => id_str)}
      element(:preferred_checkbox)                {(line_id == 0) ?
                                                    id_str = 'phoneNumber_defaultValue_add_control' :
                                                    id_str = "phoneNumber_defaultValue_line#{line_id - 1}_control"
                                                    b.checkbox(:id => id_str)}
      element(:active_checkbox)                   {(line_id == 0) ?
                                                    id_str = 'phoneNumber_active_add_control' :
                                                    id_str = "phoneNumber_active_line#{line_id - 1}_control"
                                                    b.checkbox(:id => id_str)}
      element(:add_button)                        {b.button(:id => 'OlePatronDocument-Phone_add')}
      element(:delete_button)                     {b.button(:id => "OlePatronDocument-Phone_del_line#{line_id - 1}")}
    end
  end
end