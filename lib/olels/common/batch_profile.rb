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
  # The base Batch Process Profile Page in the OLE Library System
  class Batch_Profile < OLE_QA::Framework::Page
    # Linking directly with a 'create new' link returns a stacktrace or HTTP 500.
    #   The link included in the :url attribute is for the lookup screen.
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Profile&channelUrl='
      url += ole_session.url + 'ole-kr-krad/lookup?methodToCall=start&dataObjectClassName=org.kuali.ole.batch.bo.OLEBatchProcessProfileBo&returnLocation='
      url += ole_session.url + 'portal.do&hideReturnLink=true&showMaintenanceLinks=true'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:title)                                 {b.h1(:class => 'uif-headerText').span(:class => 'uif-headerText-span')}
      element(:description_field)                     {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Description:')]]/following-sibling::td[1]/descendant::input[1]")}
      element(:explanation_field)                     {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Explanation:')]]/following-sibling::td[1]/descendant::textarea[1]")}
      element(:org_doc_number_field)                  {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Organization Document Number:')]]/following-sibling::td[1]/descendant::input[1]")}
      element(:document_id)                           {b.div(:data_label => 'Document Number')}
      element(:initiator_id)                          {b.div(:data_label => 'Initiator Network Id')}
      element(:document_status)                       {b.div(:data_label => 'Document Status')}
      element(:creation_timestamp)                    {b.div(:data_label => 'Creation Timestamp')}
      element(:batch_profile_name_field)              {b.text_field(:id => 'mainSection-MaintenanceView-batchProcessProfileName_control')}
      element(:batch_process_type_field)              {b.text_field(:id => 'mainSection-MaintenanceView-batchProcessProfileType_control')}
      element(:batch_process_type_icon)               {batch_process_type_field.parent.input(:index => 1)}
      element(:submit_button)                         {b.button(:text => 'submit')}
      element(:save_button)                           {b.button(:id => 'usave')}
      element(:cancel_button)                         {b.a(:id => 'ucancel')}
    end

    def wait_for_elements
      super
      @wait_on << :batch_profile_name_field
      @wait_on << :save_button
    end
  end
end
