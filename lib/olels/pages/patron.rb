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
  # A single patron record in the OLE Library System.
  # @note Use of this page may require a special login.  The default user,
  #   ole-khuntley, does not have sufficient permissions to create a new
  #   patron record (as of 1.0.0-M2-r13397, 07/31/2013).
  class Patron < E_Doc
    # The page object will open a new patron record by default.
    def initialize(ole_session)
      url = ole_session.url + 'ole-kr-krad/patronMaintenance?viewTypeName=MAINTENANCE&returnLocation='
      url += ole_session.url + 'portal.do&methodToCall=start&dataObjectClassName=org.kuali.ole.deliver.bo.OlePatronDocument'
      super(ole_session, url)
    end

    # Define screen elements for patron record screen.
    def set_elements
      super
    end

    # Define commonly used functions for patron record screen.
    def set_functions
      super
    end

    # Wait for certain screen elements to be present before page is considered loaded.
    def wait_for_elements
      @wait_on << :document_number
      @wait_on << :patron_id
    end

    def create_address_line(which = 1)
      create_line("address_line_#{which}","Patron_Address_Line", which)
    end
    alias_method(:add_address_line, :create_address_line)

    def create_phone_line(which = 1)
      create_line("phone_line_#{which}","Patron_Phone_Line", which)
    end
    alias_method(:add_phone_line, :create_phone_line)

    def create_email_line(which = 1)
      create_line("email_line_#{which}","Patron_Email_Line", which)
    end
    alias_method(:add_email_line, :create_email_line)

    def remove_address_line(which = 1)
      remove_line("address_line_#{which}")
    end
    alias_method(:delete_address_line, :remove_address_line)

    def remove_phone_line(which = 1)
      remove_line("phone_line_#{which}")
    end
    alias_method(:delete_phone_line, :remove_phone_line)

    def remove_email_line(which = 1)
      remove_line("email_line_#{which}")
    end
    alias_method(:delete_email_line, :remove_email_line)
  end
end