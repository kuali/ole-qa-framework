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
  # A single Line Item from a Purchase Order, as represented on an OLE Invoice E-Document.
  class Invoice_Line_Item < OLE_QA::Framework::Common_Object

    # Allow the line number to be dynamically set, as needed for addressing various PO lines on an Invoice.
    attr_accessor :line_number

    def initialize(ole_session, line_number = 1)
      @line_number = line_number
      super(ole_session)
    end

    def line_id
      @line_number - 1
    end
  end
end