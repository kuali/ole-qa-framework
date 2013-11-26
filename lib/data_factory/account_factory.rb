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

  # Generate usable accounting strings from source files in ole-qa-framework/data/
  class Account_Factory

    account_file = File.open("#{OLE_QA::Framework.data_dir}/accounts.yml",'r')
    @account_matrix = YAML.load(account_file)
    account_file.close

    object_file = File.open("#{OLE_QA::Framework.data_dir}/objects.yml",'r')
    @object_matrix = YAML.load(object_file)
    object_file.close

    class << self

      # A Hash containing a list of valid OLE Test Environment Account Numbers.
      # :Chart_Code => [['123456','Account Name'],['789012','Account Name']]
      attr_reader :account_matrix

      # A Hash containing a list of valid OLE Test Environment Object Codes.
      # :Chart_Code => [[],[]]
      attr_reader :object_matrix

      # Return a random accounting array.
      # @param chart_code [Symbol] The chart code from which the account should be selected.
      def select_account(chart_code = :BL)
        @account_matrix[chart_code].sample
      end

      # Return a random object array.
      # @param chart_code [Symbol] The chart code from which the object should be selected.
      def select_object(chart_code = :BL)
        @object_matrix[chart_code].sample
      end

    end
  end
end