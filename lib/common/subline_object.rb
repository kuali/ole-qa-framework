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
  # A Data Object in OLE that represents a line nested under another line.
  # - A subline object can be recursed under another subline object, use of the "@parent_line"
  #   instance variable should allow for continued recursion ad nauseam.
  class Subline_Object < Line_Object

    # The line under which this subline object was created.
    attr_reader :parent_line

    # @param ole_session [Object] The OLE_QA::Framework::Session session to pass to the Data Object.
    # @param line_number [Fixnum] The line number this subline object will use for element definitions.
    def initialize(ole_session, parent_line, line_number = 1)
      @parent_line = parent_line
      super(ole_session, line_number)
    end
  end
end