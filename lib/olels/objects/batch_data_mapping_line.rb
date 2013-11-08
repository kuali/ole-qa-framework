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
  # A Data Mapping Line in the OLE Library System Batch Process Bib Profile
  class Batch_Data_Mapping_Line < OLE_QA::Framework::Line_Object
    # Element definitions for the data mapping lines are expected to change in 1.5 development.
    # - Data mapping lines can currently be conceptualized as line objects that, when
    #   added, transform to subline objects.
    # - There is absolutely no need to add more than one main data mapping line, as its
    #   only function is to create sublines.
    # - This object can be considered a line object, although it represents a subline on the
    #   screen.  The first line id in the element ID attributes will be hard-coded to 0.
    # - "New line" elements will be set on the batch export profile page, with line IDs
    #   hard-coded to 0.
    #
    def set_elements

    end
  end
end