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
  # Manufacture strings for bibliographic, instance, and item record testing
  module Bib_Factory
    class << self

      include OLE_QA::Framework::Factory_Helpers

      # Return a random string of between 12 and 18 numbers to be used as a barcode.
      def barcode
        (0..(11..17).to_a.sample).map{(0..9).to_a.sample}.join
      end

      # Return a random (non-validated) call number in the specified format.
      def call_number(format = "LOC")
        call_num = Array.new
        # TODO - Use case...when once other formats are added.
        # LOC Format Call Number
        call_num << (0..(0..1).to_a.sample).map{('A'..'Z').to_a.sample}.join
        call_num << (0..(1..3).to_a.sample).map{(1..9).to_a.sample}.join << " "
        call_num << "." <<  ('A'..'Z').to_a.sample
        call_num << (0..(1..2).to_a.sample).map{(1..9).to_a.sample}.join
        call_num.join
      end

      # Return a random title with the specified length.
      def title(len = 8..12)
        if len.class == Range
          name_builder(sampler(len))
        else
          name_builder(len.to_i)
        end
      end

      # Return a random author with specified first and last name lengths.
      def author(first_len = 4..6, last_len = 8..12)
        str = String.new
        if first_len.class == Range
          str << name_builder(sampler(first_len))
        else
          str << name_builder(first_len.to_i)
        end
        str << ' '
        if last_len.class == Range
          str << name_builder(sampler(last_len))
        else
          str << name_builder(last_len.to_i)
        end
      end

      # Return a hash containing circulation desk and location information.
      # @note Pass a circulation desk code defined in data/circulation.yml to return
      #   info on a specific circulation desk.
      def circulation_info(desk_code = '')
        circ_ary = YAML.load_file(OLE_QA::Framework.data_dir + '/circulation.yml')
        hsh_out = desk_code.empty? ? circ_ary.sample : circ_ary.find {|circ| circ[:code] == desk_code}
        raise OLE_QA::Framework::Error,"No circulation desk found.#{  ' Given: ' + desk_code unless desk_code.empty?}" if hsh_out.nil?
        return hsh_out
      end
    end
  end
end
