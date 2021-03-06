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

module OLE_QA::Framework::OLEFS
  # An Exception Notes Line in an OLE Financial System Receiving Document
  class Exception_Notes_Line < OLE_QA::Framework::Subline_Object
    # Set exception notes line elements.
    def set_elements
      super
      element(:exception_type_selector)             {b.select_list(:id => "document.item[#{line_id}].exceptionNoteList[#{@subline_id}].exceptionTypeId")}
      element(:note_field)                          {b.text_field(:id => "document.item[#{line_id}].exceptionNoteList[#{@subline_id}].exceptionNotes")}
      element(:note_type_selector)                  {b.select_list(:id => "document.item[#{line_id}].exceptionNoteList[#{@subline_id}].exceptionTypeId")}
    end
  end
end