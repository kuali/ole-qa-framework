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
  # The Batch Process Job Details page in OLE.
  # @note This page refreshes about once a minute while open.
  class Batch_Job_Details < OLE_QA::Framework::Page
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Job Details&channelUrl='
      url += ole_session.url + 'ole-kr-krad/oleBatchProcessJobController?viewId=OLEBatchProcessJobDetailsView&methodToCall=jobDocHandler&command=initiate&documentClass=org.kuali.ole.batch.bo.OLEBatchProcessJobDetailsBo'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:title)                             {b.span(:class => 'uif-headerText-span')}
      element(:next_page)                         {b.a(:text => 'Next')}
      element(:previous_page)                     {b.a(:text => 'Previous')}
      element(:entries_selector)                  {b.b.div(:id => 'OLEBatchProcessJobDetailsView-listOfItems_disclosureContent').div(:index => 1).div(:index => 0).label(:index => 0).select_list(:index => 0)}
    end

    def wait_for_elements
      super
      @wait_on << :title
    end

    def set_functions
      super
      # Check whether the given text exists within the job details results displayed.
      function(:text_in_results)                  {|text| b.td(:xpath => "//table/tbody/tr/td[div/span[contains(text(),'#{text}')]]")}
      # Return the 'Remove' button for a row containing the given text.
      # @note This could be dangerous with the wrong selection text.  Use this function carefully!
      function(:remove_by_text)                   {|text| b.button(:xpath=>"//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div/fieldset/div/div/button[contains(text(),'Remove')]")}
      # Return the Job Status span for a row containing the given text.
      function(:job_status_by_text)              {|text| b.span(:xpath => "//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div/span[starts-with(@id,'statusField_line')]")}
      # Return the 'View Job Report' link for a row containing the given text.
      function(:job_report_by_text)               {|text| b.a(:xpath => "//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div/fieldset/div/div/div/a[contains(text(),'View Job Report')]")}
    end
  end
end