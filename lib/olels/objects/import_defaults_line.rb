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
  # A Defaults and Constants Line on an OLE Library System Batch Import Profile
  class Import_Defaults_Line < OLE_QA::Framework::Line_Object
    def set_elements
      element(:data_type)                   {b.span(:id => "profileConstants_dataType_line#{line_id}_control")}
      element(:field_name_1)                {b.span(:id => "constant-datatype-bibmarc_line#{line_id}_control")}
      element(:field_name_2)                {b.span(:id => "profileConstants_attributeName1_line#{line_id}_control")}
      element(:field_value)                 {b.span(:id => "profileConstants_attributeValue_line#{line_id}_control")}
      element(:default_or_constant)         {b.span(:id => "profileConstants_defaultValue_line#{line_id}_control")}
      element(:delete_button)               {b.button(:id => "ProfileConstant-delete_line#{line_id}")}
    end
  end
end
