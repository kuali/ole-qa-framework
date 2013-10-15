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
  # An Extent of Ownership Line on the OLE Library System Instance Editor.
  class Ownership_Extent_Line < OLE_QA::Framework::Line_Object

    def set_elements
      element(:type_selector)                     {b.select_list(:id => "extentTextualHoldingsType_line#{line_id}_control")}
      element(:statement_field)                   {b.text_field(:id => "extentTextualHoldings_line#{line_id}_control")}
      element(:add_button)                        {b.button(:id => "extentOfOwnership_addTagButton_line#{line_id}")}
      element(:remove_button)                     {b.button(:id => "extentOfOwnership_removeTagButton_line#{line_id}")}
    end

    def set_sublines
      set_subline(:ownership_note, OLE_QA::Framework::OLELS::Ownership_Note)
    end
  end
end
