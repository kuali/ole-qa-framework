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
  # A Filter Criteria Line on the OLE Library System Batch Export Process Profile
  class Export_Filter_Line < OLE_QA::Framework::Line_Object

    def set_elements
      element(:name)                        {b.span(:id => "filterCriteria_filterFieldName_select_line#{line_id}_control")}
      element(:name_readonly)               {b.span(:id => "filterCriteria_filterFieldName_text_line#{line_id}_control")}
      element(:value)                       {b.span(:id => "filterCriteria_filterFieldValue_line#{line_id}_control")}
      element(:range_from)                  {b.span(:id => "filterCriteria_filterRangeFrom_line#{line_id}_control")}
      element(:range_to)                    {b.span(:id => "filterCriteria_filterRangeTo_line#{line_id}_control")}
      element(:delete_button)               {b.button(:id => "filterCriteria-delete_line#{line_id}")}
    end
  end
end