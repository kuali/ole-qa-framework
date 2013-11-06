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

module OLE_QA::Framework::OLELS

  class Batch_Export < OLE_QA::Framework::Page
    def initialize(ole_session)
      url = ole_session.url + ''
      url += ole_session.url + ''
      super(ole_session, url)
    end

    def set_elements

    end

    def wait_for_elements
      super
    end

    def set_functions

    end
  end
end
