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

module OLE_QA::Framework::OLEFS
  # This object is an inheritable base class for all line-type objects on an OLE Financial System Invoice.
  # - This class provides a different mechanism for line_id and makes line_number an accessor attribute,
  #   allowing for dynamic redefinition of line object elements and sub-elements.
  # - Instead of instantiating a new line object for each line and subline, the line_number can be updated
  #   in each line and subline object.  This allows for slightly deeper recursion without the need of
  #   introducing a new level of sub-object below the subline object.
  #
  class Invoice_Line_Object < OLE_QA::Framework::Common_Object
    # Allow the line_number attribute to be updated for dynamic element definitions.
    attr_accessor :line_number

    def initialize(ole_session, line_number = 1)
      @line_number = line_number
      super(ole_session)
    end

    # A reader method for the line_id function.
    def line_id
      @line_number - 1
    end
  end
end