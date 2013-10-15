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

  # Represents a Marc control field 006 line in the OLELS Bib Editor.
  class Control_007_Line < OLE_QA::Framework::Line_Object

    # Set Marc data line elements.
    def set_elements
      element(:field)                       {b.text_field(:id => "Control_Field_007_line#{line_id}_control")}
      element(:add_button)                  {b.button(:id => "Control_Field_007_addTagButton_id_line#{line_id}")}
      element(:edit_button)                 {b.button(:id => "Control_Field_007_EditTagButton_id_line#{line_id}")}
      element(:remove_button)               {b.button(:id => "Control_Field_007_removeTagButton_id_line#{line_id}")}
      element(:clear_button)                {b.button(:id => "Control_Field_007_clearTagButton_id_line#{line_id}")}
    end
  end
end