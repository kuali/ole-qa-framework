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
  # A line of email address information on a patron record.
  class Patron_Email_Line < Line_Object
    # Set screen elements on patron record email info line.
    def set_elements
      element(:email_type_selector)                       {(@line_id == 0) ?
                                                            id_str = 'emailTypeCode_add_control' :
                                                            id_str = "emailTypeCode_line#{@line_id - 1}_control"
                                                            b.select_list(:id => id_str)}
      element(:email_address_field)                       {(@line_id == 0) ?
                                                            id_str = 'emailAddress_add_control' :
                                                            id_str = "emailAddress_line#{@line_id - 1}_control"
                                                            b.text_field(:id => id_str)}
      element(:preferred_checkbox)                        {(@line_id == 0) ?
                                                            id_str = 'email_defaultValue_add_control' :
                                                            id_str = "email_defaultValue_line#{@line_id - 1}_control"
                                                            b.checkbox(:id => id_str)}
      element(:active_checkbox)                           {(@line_id == 0) ?
                                                            id_str = 'email_active_add_control' :
                                                            id_str = "email_active_line#{@line_id - 1}_control"
                                                            b.checkbox(:id => id_str)}
      element(:add_button)                                {b.button(:id => 'OlePatronDocument-Email_add')}
      element(:delete_button)                             {b.button(:id => "OlePatronDocument-Email_del_line#{@line_id - 1}")}
    end
  end
end