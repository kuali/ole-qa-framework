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

  class Batch_Job_Details < OLE_QA::Framework::Page
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Job Details&channelUrl='
      url += ole_session.url + 'ole-kr-krad/oleBatchProcessJobController?viewId=OLEBatchProcessJobDetailsView&methodToCall=jobDocHandler&command=initiate&documentClass=org.kuali.ole.batch.bo.OLEBatchProcessJobDetailsBo'
      super(ole_session, url)
    end

    def set_elements
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
      # Check whether the given text exists within the job details results displayed.
      function(:text_in_results)                  {|text| b.td(:xpath => "//table/tbody/tr/td[div/span[contains(text(),'#{text}')]]")}
      function(:remove_by_text)                   {|text| b.button(:xpath=>"//table/tbody/tr[td/div/span[contains(text(),'JF_TestGPF_53')]]/td/div/fieldset/div/div/button[contains(text(),'Remove')]")}
      function(:job_report_by_text)               {|text| b.a(:xpath => "//table/tbody/tr[td/div/span[contains(text(),'#{text}')]]/td/div/fieldset/div/div/div/a[contains(text(),'View Job Report')]")}
    end
  end
end