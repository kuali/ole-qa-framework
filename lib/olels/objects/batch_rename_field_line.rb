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
  # A Rename Field line on the OLE Library System Batch Process Bib Profile
  class Batch_Rename_Field_Line < OLE_QA::Framework::Line_Object
    def set_elements
      element(:orig_tag)                    {b.span(:id => "originalField_originalTag_line#{line_id}_control")}
      element(:orig_ind_1)                  {b.span(:id => "originalField_originalIndicator1_line#{line_id}_control")}
      element(:orig_ind_2)                  {b.span(:id => "originalField_originalIndicator2_line#{line_id}_control")}
      element(:orig_subfield)               {b.span(:id => "originalField_originalSubField_line#{line_id}_control")}
      element(:orig_contains)               {b.span(:id => "originalField_originalSubFieldContains_line#{line_id}_control")}
      element(:new_tag)                     {b.span(:id => "renameField_renamedTag_line#{line_id}")}
      element(:new_ind_1)                   {b.span(:id => "renameField_renamedIndicator1_line#{line_id}_control")}
      element(:new_ind_2)                   {b.span(:id => "renameField_renamedIndicator2_line#{line_id}")}
      element(:new_subfield)                {b.span(:id => "renameField_renamedSubField_line#{line_id}_control")}
      element(:new_contains)                {b.span(:id => "renameField_renamedSubFieldContains_line#{line_id}_control")}
      element(:delete_button)               {b.button(:id => "renameField-delete_line#{line_id}")}
    end
  end
end