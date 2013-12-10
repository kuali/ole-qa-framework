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
  # Return usable patron records from source files in ole-qa-framework/data/patron.yml
  class Patron_Factory
    patron_file = File.open("#{OLE_QA::Framework.data_dir}/patron.yml",'r')
    @patron_matrix = YAML.load(patron_file)
    patron_file.close

    class << self
      # An array containing a collection of valid OLE patron records.
      attr_reader :patron_matrix

      # Return a random patron record.
      def select_patron
        @patron_matrix.sample
      end
    end
  end
end
