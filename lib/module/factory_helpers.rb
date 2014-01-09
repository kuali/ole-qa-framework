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
  # This mix-in module contains helper methods for other data factory modules.
  module Factory_Helpers
    def name_builder(len = 8)
      out = Array.new
      out << sampler
      len -= 1
      len.times do
        out << sampler('a'..'z')
      end
      out.join
    end
    private :name_builder

    def sampler(r = 'A'..'Z')
      r.to_a.sample
    end
    private :sampler

    def str(len=8)
      ary = Array.new
      len.times { ary << sampler('a'..'z') }
      ary.join
    end
    private :str

    def num_str(len = 8)
      ary = Array.new
      len.times { ary << sampler('0'..'9') }
      ary.join
    end
    private :num_str
          
  end
end
