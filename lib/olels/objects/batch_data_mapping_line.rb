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
      element(:data_type)                             {b.span(:id => "batchExportDataTypeField_line0_line#{line_id}_control")}
      element(:source)                                {b.span(:id => "holding-sourcefield_line0_line#{line_id}_control")}
      element(:source_2)                              {b.span(:id => "dataMappingOptions_sourceField1_line0_line#{line_id}_control")}
      element(:source_field_value)                    {b.span(:id => "dataMappingOptions_sourceFieldValue_line0_line#{line_id}_control")}
      element(:destination_data_type)                 {b.span(:id => "batchExportDataType-destinationfield_line0_line#{line_id}_control")}
      element(:destination_field)                     {b.span(:id => "bibmarc_destinationField_line0_line#{line_id}_control")}
      element(:destination_field_2)                   {b.span(:id => "dataMappingOptions_destinationField1_line0_line#{line_id}_control")}
      element(:destination_field_value)               {b.span(:id => "dataMappingOptions_destinationFieldValue_line0_line#{line_id}_control")}
      element(:priority)                              {b.span(:id => "dataMappingOptions_priority_line0_line#{line_id}_control")}
      element(:delete_button)                         {b.button(:id => "addLineDataMapping-delete_line0_line#{line_id}")}
    end
  end
end