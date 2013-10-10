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

module OLE_QA::Framework

  # A Data Object in OLE that represents a single line in a given area.
  # A line object can usually be added or deleted, and may or may not
  # have its own line objects beneath it in the page-object hierarchy.
  class Line_Object < Data_Object

    # The line number that this object will have on the screen.
    # - This is the 1-based line number used for replacement of human-readable identifiers.
    attr_accessor :line_number

    # @param ole_session [Object] The OLE_QA::Framework::Session session to pass to the Data Object.
    # @param line_number [Fixnum] The number this line object will use for element definitions.
    def initialize(ole_session, line_number = 1)
      @line_number = line_number
      super(ole_session)
    end

    # A reader method for the line_id function.
    # - This is the 0-based line number used for replacement of programmatic identifiers such as element IDs.
    def line_id
      @line_number - 1
    end
  end
end