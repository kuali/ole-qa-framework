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
  # A Batch Process job report page in OLE.
  class Batch_Job_Report < OLE_QA::Framework::Page
    # It is not possible link directly to a job report by job ID in OLE.
    #   A form key is generated when the report is accessed, and the URL will not work without one.
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Job Details&channelUrl='
      url += ole_session.url + 'ole-kr-krad/oleBatchProcessJobController?viewId=OLEBatchProcessJobDetailsView&methodToCall=jobDocHandler&command=initiate&documentClass=org.kuali.ole.batch.bo.OLEBatchProcessJobDetailsBo'
      super(ole_session,url)
    end

    def set_elements
      element(:title)                       {b.h2.span(:class => 'uif-headerText-span')}
      element(:job_id)                      {b.span(:id => 'jobIdField-popup_control')}
      element(:job_name)                    {b.span(:id => 'jobNameField-popup_control')}
      element(:batch_process_type)          {b.span(:id => 'batchProcessType-popup_control')}
      element(:batch_profile_name)          {b.span(:id => 'batchProfileNameField-popup_control')}
      element(:upload_file_name)            {b.span(:id => 'uploadFileNameField-popup_control')}    # Order Record Import jobs only
      element(:create_time)                 {b.span(:id => 'createTimeField-popup_control')}
      element(:batch_process_id)            {b.span(:id => 'batchProcessIdField-popup_control')}
      element(:user_name)                   {b.span(:id => 'userNameField-popup_control')}
      element(:total_records)               {b.span(:id => 'totalNoOfRecordsField-popup_control')}
      element(:records_processed)           {b.span(:id => 'noOfRecordsProcessedField-popup_control')}
      element(:success_records)             {b.span(:id => 'noOfSuccessRecordsField-popup_control')}    # "N/A" on Order Record Import
      element(:failure_records)             {b.span(:id => 'noOfFailureRecordsField-popup_control')}    # "N/A" on Order Record Import
      element(:percent_completed)           {b.span(:id => 'perCompletedField-popup_control')}
      element(:start_time)                  {b.span(:id => 'startTimeField-popup_control')}
      element(:end_time)                    {b.span(:id => 'endTimeField-popup_control')}
      element(:time_spent)                  {b.span(:id => 'timeSpentField-popup_control')}
      element(:status)                      {b.span(:id => 'statusField-popup_control')}
      element(:status_description)          {b.span(:id => 'statusDescField-popup_control')}
    end

    def wait_for_elements
      super
      @wait_on << :title << :job_id << :batch_process_id << :status
    end
  end
end