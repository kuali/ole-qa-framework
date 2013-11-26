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
  # Manufacture strings for bibliographic record testing
  class Bib_Factory
    # Return a random string of between 12 and 18 numbers to be used as a barcode.
    def self.barcode
      (0..(11..17).to_a.sample).map{(0..9).to_a.sample}.join
    end

    # Return a random (non-validated) call number in the specified format.
    def self.call_number(format = "LOC")
      call_num = Array.new
      # TODO - Use case...when once other formats are added.
      # LOC Format Call Number
      call_num << (0..(0..1).to_a.sample).map{('A'..'Z').to_a.sample}.join
      call_num << (0..(1..3).to_a.sample).map{(1..9).to_a.sample}.join << " "
      call_num << "." <<  ('A'..'Z').to_a.sample
      call_num << (0..(1..2).to_a.sample).map{(1..9).to_a.sample}.join
      call_num.join
    end
  end
end