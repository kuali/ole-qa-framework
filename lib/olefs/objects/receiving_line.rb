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
  # A single line on an OLE Financial System Receiving Document
  class Receiving_Line < OLE_QA::Framework::Line_Object
    # Create accessor methods for new subline objects.
    def set_sublines
      set_subline(:exception_notes_line, OLE_QA::Framework::OLEFS::Exception_Notes_Line)
      set_subline(:receipt_notes_line, OLE_QA::Framework::OLEFS::Receipt_Notes_Line)
      set_subline(:copies_line, OLE_QA::Framework::OLEFS::Copies_Line)
      set_subline(:processing_line, OLE_QA::Framework::OLEFS::Processing_Line)
    end

    # Set receiving line elements.
    def set_elements
      super
      element(:receive_button)                            {b.input(:alt => 'Receive')}
      element(:description_field)                         {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[2]")}
      element(:quantity_ordered_field)                    {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[4]")}
      element(:parts_ordered_field)                       {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[5]")}
      element(:prior_quantity_received_field)             {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[6]")}
      element(:prior_parts_received_field)                {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[7]")}
      element(:quantity_to_be_received_field)             {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[8]")}
      element(:parts_to_be_received_field)                {b.td(:xpath => "//table[@summary='Items Section']/tbody/tr/td[1][b[contains(text(),'#{@line_number}')]]/following-sibling::td[9]")}
      element(:item_received_quantity_field)              {b.text_field(:id => "document.item[#{line_id}].oleItemReceivedTotalQuantity")}
      element(:item_received_parts_field)                 {b.text_field(:id => "document.item[#{line_id}].oleItemReceivedTotalParts")}
      element(:item_returned_quantity_field)              {b.text_field(:id => "document.item[#{line_id}].oleItemReturnedTotalQuantity")}
      element(:item_returned_parts_field)                 {b.text_field(:id => "document.item[#{line_id}].oleItemReturnedTotalParts")}
      element(:item_damaged_quantity_field)               {b.text_field(:id => "document.item[#{line_id}].oleItemDamagedTotalQuantity")}
      element(:item_damaged_parts_field)                  {b.text_field(:id => "document.item[#{line_id}].oleItemDamagedTotalParts")}
      element(:available_to_public_checkbox)              {b.checkbox(:id => "document.item[#{line_id}].availableToPublic")}
      element(:public_view_checkbox)                      {b.checkbox(:id => "document.item[#{line_id}].availableToPublic")}
      element(:exception_notes_toggle)                    {b.input(:xpath => "//tr[td/b[contains(text(),'#{@line_number}')]]/following-sibling::tr[2]/td[1]/table/tbody/tr[1]/th/div/input")}
      element(:receipt_notes_toggle)                      {b.input(:xpath => "//tr[td/b[contains(text(),'#{@line_number}')]]/following-sibling::tr[3]/td[1]/table/tbody/tr[1]/th/div/input")}
      element(:special_processing_instructions_toggle)    {b.input(:xpath => "//tr[td/b[contains(text(),'#{@line_number}')]]/following-sibling::tr[4]/td[1]/table/tbody/tr[1]/th/div/input")}
      element(:copies_line_toggle)
      # New Receipt Note Elements
      element(:receipt_note_type_selector)                {b.select_list(:id => "document.item[#{line_id}].noteTypeId")}
      element(:receipt_note_field)                        {b.text_field(:id => "document.item[#{line_id}].receiptNotes")}
      element(:add_receipt_note_button)                   {b.input(:name => "methodToCall.addReceiptNote.line#{line_id}")}
      # New Exception Note Elements
      element(:exception_type_selector)                   {b.select_list(:id => "document.item[#{line_id}].exceptionTypeId")}
      element(:exception_note_field)                      {b.text_field(:id => "document.item[#{line_id}].exceptionNotes")}
      element(:add_exception_note_button)                 {b.input(:name => "methodToCall.addExceptionNOte.line#{line_id}")}
    end
  end
end
