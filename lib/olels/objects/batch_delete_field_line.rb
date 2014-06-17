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
  # A Delete Field line on the OLE Library System Batch Process Bib Profile
  class Batch_Delete_Field_Line < OLE_QA::Framework::Line_Object
    def set_elements
      element(:name)                      {b.span(:id => "deleteField_tag_line#{line_id}_control")}
      element(:ind_1)                     {b.span(:id => "deleteField_indicator1_line#{line_id}_control")}
      element(:ind_2)                     {b.span(:id => "deleteField_indicator2_line#{line_id}_control")}
      element(:subfield)                  {b.span(:id => "deleteField_subField_line#{line_id}_control")}
      element(:delete_button)             {b.button(:id => "deleteField-delete_line#{line_id}")}
    end
  end
end