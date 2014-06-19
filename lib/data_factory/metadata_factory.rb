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
  # This class contains methods to generate assorted metadata for the OLE application.
  #   {OLE_QA::Framework::Bib_Factory} should be used for creating bibliographic metadata.
  module Metadata_Factory
    class << self
      include OLE_QA::Framework::Factory_Helpers
      
      # Generate a usable OLE location code.
      def location_code
        str_out = String.new
        str_out << sampler('A'..'Z')
        str_out << sampler('0'..'9')
        str_out << str(sampler(2..4))
        str_out.upcase
      end
      alias_method(:new_location_code,:location_code)

      # Create a new location as a hash.
      # @param [String] level   Set the location's level.  (Optional, defaults to 1.)
      # @param [String] parent  The parent location code.  (Optional, defaults to none.)
      def new_location(level = 1, parent = '')
        hash                    = Hash.new
        hash[:code]             = location_code
        hash[:name]             = name_builder(sampler(6..8))
        hash[:description]      = name_builder(sampler(8..12))
        hash[:level]            = level.to_s
        hash[:parent]           = parent unless parent.empty?
        hash
      end

    end
  end
end
