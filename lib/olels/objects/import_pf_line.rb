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
  # A Profile (Local) Protected Fields Line on an OLE Library System Batch Import Profile
  class Import_PF_Line < OLE_QA::Framework::Line_Object
    def set_elements
      element(:tag)                       {b.span(:id => "profileProtectedFields_tag_line#{line_id}_control")}
      element(:ind_1)                     {b.span(:id => "profileProtectedFields_firstIndicator_line#{line_id}_control")}
      element(:ind_2)                     {b.span(:id => "profileProtectedFields_secondIndicator_line#{line_id}_control")}
      element(:subfield)                  {b.span(:id => "profileProtectedFields_subField_line#{line_id}_control")}
      element(:subfield_match)            {b.span(:id => "profileProtectedFields_subFieldContains_line#{line_id}_control")}
      element(:delete_button)             {b.button(:id => "ProfileProtectedField-delete_line#{line_id}")}
    end
  end
end
