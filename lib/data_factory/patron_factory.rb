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
  # Return usable patron records from source files in ole-qa-framework/data/patron.yml
  module Patron_Factory


    @patron_matrix    = YAML.load(File.read("#{OLE_QA::Framework.data_dir}/patron.yml"))
    @states           = YAML.load(File.read("#{OLE_QA::Framework.data_dir}/states.yml"))
    @borrower_types   = YAML.load(File.read("#{OLE_QA::Framework.data_dir}/borrower_types.yml"))

    class << self

      
      include OLE_QA::Framework::Factory_Helpers

      # An array containing a collection of valid OLE patron records.
      attr_reader :patron_matrix

      # An array containing a collection of valid states to use for patron records.
      attr_reader :states

      # An array containing a collection of valid borrower types to use for patron records.
      attr_reader :borrower_types

      # Return a random patron record.
      def select_patron
        @patron_matrix.sample
      end

      def new_patron
        patron                  = Hash.new
        patron[:first]          = name_builder(sampler(2..8))
        patron[:last]           = name_builder(sampler(6..8))
        patron[:barcode]        = num_str(sampler(6..12))
        patron[:borrower_type]  = @borrower_types.sample
        patron[:address]        = num_str(sampler(3..5)) + ' ' + name_builder(sampler(4..8)) + ' ' + name_builder(2)
        patron[:city]           = name_builder(sampler(4..12))
        patron[:state]          = @states.sample.upcase
        patron[:postal_code]    = num_str(5)
        patron[:phone]          = num_str(3) + '-' + num_str(3) + '-' + num_str(4)
        patron[:email]          = patron[:first] + patron[:last] + '@' + str(sampler(4..8)) + '.' + str(3)
        patron
      end

    end
  end
end
