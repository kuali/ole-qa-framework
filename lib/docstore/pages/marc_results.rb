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

module OLE_QA::Framework::DocStore
  # OLE Document Store Search Results for a Marc Bibliographic Record search.
  class Marc_Results < Results

    def set_elements
      super

    end

    def set_functions
      super
      # Return a 'view' button by a given (1-based) numerical value.
      function(:view_button)                        { |which = 1| which -= 1 ; b.button(:value => /View/, :index => which)}
      # Return an 'edit' button by a given (1-based) numerical value.
      function(:edit_button)                        { |which = 1| which -= 1 ; b.button(:name => 'Edit', :index => which)}
      # Return an 'instance' link by a given (1-based) numerical value.
      function(:instance_link)                      { |which = 1| which -= 1 ; b.b(:text => /Instance/, :index => which).parent}
      # Return a field value (other than title) in the results.
      # @note This just returns the object for the value.  Interrogate that object with .present? to confirm
      #   its existence in the search results.
      function(:value_in_results)                   { |which| b.dd(:text => /#{which}/) }
      # Return an instance link containing the given text.
      function(:instance_text)                      { |which| b.b(:text => /#{which}/).parent }
    end
  end
end