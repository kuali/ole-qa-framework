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

module OLE_QA::Framework
  # Generate random alphabetic, numeric, or alphanumeric strings of a given length
  module String_Factory
    class << self

      include OLE_QA::Framework::Factory_Helpers

      def alpha(len = 9)
        str(len).upcase
      end

      def numeric(len = 9)
        num_str(len)
      end

      def alphanumeric(len = 9)
        str_out = String.new
        len.times do
          str_out << (('A'..'Z').to_a + ('0'..'9').to_a).sample
        end
        str_out
      end

      def phone
        str_out = '555-'
        str_out << num_str(3)
        str_out << '-'
        str_out << num_str(4)
        str_out
      end

      def price
        str = String.new
        str << num_str(sampler(1..3)) << '.' << '00'
      end
    end
  end
end
