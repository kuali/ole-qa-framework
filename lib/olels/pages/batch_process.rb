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
      element(:run_button)                  {b.button(:id => 'runNowButton')}
      element(:schedule_button)             {b.button(:id => 'scheduleButton')}
      element(:marc_file_field)             {b.input(:id => 'marcFileField_control').to_subtype}
      element(:edi_file_field)              {b.input(:id => 'ediFileField_control').to_subtype}
      element(:message)                     {b.li(:class => 'uif-infoMessageItem')}
    end

    def wait_for_elements
      super
      @wait_on << :title
      @wait_on << :name_field
      @wait_on << :run_button
    end
  end
end
