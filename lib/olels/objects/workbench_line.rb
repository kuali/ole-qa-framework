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
  # A search line on the OLE Library System Describe Workbench page.
  class Workbench_Line < OLE_QA::Framework::Line_Object
    def set_elements
      super
      element(:search_field)                {(line_id == 0) ?
                                              id_str = 'SearchConditions_SearchText_id_add_control' :
                                              id_str = "SearchConditions_SearchText_id_line#{line_id - 1}_control"
                                              b.text_field(:id => id_str)}
      # @note Options for this selector are 'AND', 'OR', and 'phrase'.
      element(:search_scope_selector)       {(line_id == 0) ?
                                              id_str = 'SearchConditions_Operator_id_add_control' :
                                              id_str = "SearchConditions_Operator_id_line#{line_id - 1}_control"
                                              b.select_list(:id => id_str)}
      element(:field_selector)              {(line_id == 0) ?
                                              id_str = 'SearchConditions_DocField_id_add_control' :
                                              id_str = "SearchConditions_DocField_id_line#{line_id - 1}_control"
                                              b.select_list(:id => id_str)}
      element(:join_and)                    {(line_id == 0) ?
                                              id_str = 'SearchConditions_SearchScope_id_add_control_0' :
                                              id_str = "SearchConditions_SearchScope_id_line#{line_id - 1}_control_0"
                                              b.radio(:id => id_str)}
      element(:join_or)                     {(line_id == 0) ?
                                              id_str = 'SearchConditions_SearchScope_id_add_control_1' :
                                              id_str = "SearchConditions_SearchScope_id_line#{line_id - 1}_control_1"
                                              b.radio(:id => id_str)}
      element(:join_not)                    {(line_id == 0) ?
                                              id_str = 'SearchConditions_SearchScope_id_add_control_2' :
                                              id_str = "SearchConditions_SearchScope_id_line#{line_id - 1}_control_2"
                                              b.radio(:id => id_str)}
      element(:add_button)                  {b.button(:id => 'SearchConditionsSection_add')}
      element(:delete_button)               {b.button(:id => "SearchConditionsSection_del_line#{line_id - 1}")}
    end
  end
end