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
      element(:search_field)                {b.text_field(:id => "SearchConditions_SearchText_id_line#{line_id}_control")}
      # @note Options for this selector are 'AND', 'OR', and 'phrase'.
      element(:search_scope_selector)       {b.select_list(:id => "SearchConditions_Operator_id_line#{line_id}_control")}
      element(:field_selector)              {b.select_list(:id => "SearchConditions_DocField_id_line#{line_id}_control")}
      element(:join_and)                    {b.radio(:id => "SearchConditions_SearchScope_id_line#{line_id}_control_0")}
      element(:join_or)                     {b.radio(:id => "SearchConditions_SearchScope_id_line#{line_id}_control_1")}
      element(:join_not)                    {b.radio(:id => "SearchConditions_SearchScope_id_line#{line_id}_control_2")}
      element(:add_button)                  {b.button(:id => "addLineField-Add_line#{line_id}")}
      element(:delete_button)               {b.button(:id => "deleteLineField-Delete_line#{line_id}")}
    end
  end
end