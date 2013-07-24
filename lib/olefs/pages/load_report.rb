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

module OLE_QA::Framework::OLEFS
  # An OLE Financial System staff upload load report.
  class Load_Report < E_Doc
    # Initializes with Load Summary Lookup URL.
    #  (Requires document ID number to retrieve by URL.)
    def initialize(ole_session)
      url = ole_session.fs_url + 'portal.do?channelTitle=Load%20Reports&channelUrl=batchlookup.do?methodToCall=start&businessObjectClassName=org.kuali.ole.select.businessobject.OleLoadSumRecords&docFormKey=88888888&returnLocation='
      url += ole_session.fs_url + 'portal.do&hideReturnLink=true'
      super(ole_session, url)
    end

    # Set load report screen elements.
    def set_elements
      super
      element(:profile_name)                {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'Name Of Load Profile')]]/following-sibling::td")}
      element(:user_id)                     {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'User ID')]]/following-sibling::td")}
      element(:counts)                      {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'Counts')]]/following-sibling::td")}
      element(:file_name)                   {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'Name Of File')]]/following-sibling::td")}
      element(:number_of_pos)               {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'No. Of POs Created')]]/following-sibling::td")}
      element(:number_of_bibs)              {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'No. Of Bibs Created')]]/following-sibling::td")}
      element(:po_link)                     {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'List Of All POs')]]/following-sibling::td").a}
      element(:bib_link)                    {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'List Of All Bibs')]]/following-sibling::td").a}
      element(:upload_description)          {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'Description')]]/following-sibling::td")}
      element(:upload_date)                 {b.td(:xpath => "//table[@class = 'datatable']/descendant::th[div[contains(text(),'Date Of Load')]]/following-sibling::td")}
    end

    def wait_for_elements
      super
      @wait_on << :counts
      @wait_on << :upload_description
      @wait_on << :upload_date
    end

    def set_functions
      super
      # Total Count from 'Counts' cell.
      # @return [String] The total number of records uploaded.
      function(:total_count)                {counts.text.match(/(?<=TOTAL\: )\d+(?=\s)/).to_s}
      # Success Count from 'Counts' cell.
      # @return [String] The total number of records successfully processed.
      function(:success_count)              {counts.text.match(/(?<=SUCCESS\: )\d+(?=\s)/).to_s}
      # Failure Count from 'Counts' cell.
      # @return [String] The total number of records unsuccessfully processed.
      function(:failure_count)              {counts.text.match(/(?<=FAILED\: )\d+(?=$)/).to_s}
      # Use a regular expression to return the year/month/day value in the upload date field.
      # @return [String] The upload date, in MM/DD/YYYY format.
      function(:upload_date_ymd)            {upload_date.text.match(/\d{2}\/\d{2}\/\d{4}/)}
      # Use a regular expression to return the time-of-day value in the upload date field.
      # @return [String] The upload time, in HH:MM AM/PM format.
      function(:upload_date_tod)            {upload_date.text.match(/\d{2}\:\d{2}\s+[AP]M/)}
    end
  end
end