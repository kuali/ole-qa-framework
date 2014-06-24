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

module OLE_QA::Framework::OLELS
  # The Batch Process control screen in the OLE Library System
  class Batch_Process < OLE_QA::Framework::Page
    # Define URL in initialize.
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process&channelUrl='
      url += ole_session.url + 'ole-kr-krad/oleBatchProcessDefinitionController?viewId=OLEBatchProcessDefinitionView&methodToCall=startBatch&command=initiate&documentClass=org.kuali.ole.batch.document.OLEBatchProcessDefinitionDocument'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:title)                       {b.h1.span}
      element(:name_field)                  {b.text_field(:id => 'BatchProcessDefinition-batchProcessName_control')}
      element(:profile_name_field)          {b.text_field(:id => 'BatchProcessDefinition-batchProcessProfileName_control')}
      element(:profile_search_icon)         {b.input(:title => 'Search Field')}
      element(:batch_size_field)            {b.text_field(:id => 'chunkSizeField_control')}
      element(:email_field)                 {b.text_field(:id => 'emailField_control')}
      element(:output_format_selector)      {b.select_list(:id => 'outputField_control')}
      element(:output_file_field)           {b.text_field(:id => 'outputFileField_control')}
      element(:input_file_field)            {b.input(:id => 'ingestInputFile_control').to_subtype}
      element(:run_now_option)              {b.radio(:id => 'RunNow_Schedule_control_0')}
      element(:schedule_option)             {b.radio(:id => 'RunNow_Schedule_control_1')}
      element(:marc_file_field)             {b.input(:id => 'marcFileField_control').to_subtype}
      element(:edi_file_field)              {b.input(:id => 'ediFileField_control').to_subtype}
      element(:message)                     {b.li(:class => 'uif-infoMessageItem')}
      # The cron_expression_option and scheduler_option appear after schedule_option is selected.
      element(:cron_expression_option)      {b.radio(:id => 'Schedule-provideCronExp_control_0')}
      element(:scheduler_option)            {b.radio(:id => 'Schedule-provideCronExp_control_1')}
      element(:one_time_option)             {b.radio(:id => 'Schedule-oneTimeOrRecurring_control_0')}
      element(:recurring_option)            {b.radio(:id => 'Schedule-oneTimeOrRecurring_control_1')}
      element(:cron_expression_field)       {b.text_field(:id => 'Schedule-cronExpField_control')}
      element(:schedule_date_field)         {b.text_field(:id => 'Schedule-DateField_control')}
      element(:schedule_time_field)         {b.text_field(:id => 'Schedule-timeField_control')}
      element(:schedule_daily_option)       {b.radio(:id => 'Schedule-RadioButtons_control_0')}
      element(:schedule_weekly_option)      {b.radio(:id => 'Schedule-RadioButtons_control_1')}
      element(:schedule_monthly_option)     {b.radio(:id => 'Schedule-RadioButtons_control_2')}
      element(:schedule_start_time_field)   {b.radio(:id => 'Schedule-startTimeField_control')}
      element(:monday_checkbox)             {b.checkbox(:id => 'weekDaysField_control_0')}
      element(:tuesday_checkbox)            {b.checkbox(:id => 'weekDaysField_control_1')}
      element(:wednesday_checkbox)          {b.checkbox(:id => 'weekDaysField_control_2')}
      element(:thursday_checkbox)           {b.checkbox(:id => 'weekDaysField_control_3')}
      element(:friday_checkbox)             {b.checkbox(:id => 'weekDaysField_control_4')}
      element(:saturday_checkbox)           {b.checkbox(:id => 'weekDaysField_control_5')}
      element(:sunday_checkbox)             {b.checkbox(:id => 'weekDaysField_control_6')}
      element(:day_of_month_selector)       {b.select(:id => 'weekNumberField_control')}
      element(:month_number_field)          {b.text_field(:id => 'monthNumberField_control')}
      # Please note that these buttons will not show up unless a Batch Process Profile is selected.
      #   - JKW, 6/24/2014, 1.5-M2-r19440
      element(:submit_button)               {b.button(:id => 'BP-Uif-SubmitAction')}
      element(:close_button)                {b.button(:id => 'uclose')}
      element(:clear_button)                {b.button(:class => 'btn',:text => /[Cc]lear/)}
      element(:cancel_button)               {b.button(:id => 'ucancel')}
    end

    def wait_for_elements
      super
      @wait_on << :title
      @wait_on << :name_field
      @wait_on << :run_now_option
    end
  end
end
