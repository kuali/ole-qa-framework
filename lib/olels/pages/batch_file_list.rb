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
  # A File List screen for a Batch Export in the OLE Library System
  class Batch_File_List < OLE_QA::Framework::Page
    # Uses Batch Job Details page link.
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Batch Process Job Details&channelUrl='
      url += ole_session.url + 'ole-kr-krad/oleBatchProcessJobController?viewId=OLEBatchProcessJobDetailsView&methodToCall=jobDocHandler&command=initiate&documentClass=org.kuali.ole.batch.bo.OLEBatchProcessJobDetailsBo'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:title)                               {b.span(:class => 'uif-headerText-span')}
      element(:entries_selector)                    {b.label(:text => /^Show/,:text => /entries$/).select_list(:index => 0)}
      element(:entries_text)                        {b.div(:class => 'dataTables_info',:text => /Showing \d+ to \d+ of \d+ entries/)}
      element(:next_button)                         {b.a(:class => 'paginate_active',:class => 'next')}
      element(:previous_button)                     {b.a(:class => 'paginate_active',:class => 'previous')}
      element(:first_button)                        {b.a(:class => 'paginate_active',:class => 'first')}
      element(:last_button)                         {b.a(:class => 'paginate_active',:class => 'last')}
    end

    def set_functions
      super
      # Return the link to a file by searching for the given string or regular expression in the filename.
      function(:link_by_filename)                   {|which| b.div(:class => 'uif-linkField',:id => /fileList_line\d+/,:text => which).a}
      # Return whether the link to a file with the given text or regular expression is present.
      function(:link_by_filename?)                  {|which| link_by_filename(which).present?}
      # Return how many total entries exist for this staging area directory.
      #   e.g. Y in 'Showing 1 to X of Y entries'
      function(:total_entries)                      { entries_text.present? ? entries_list.text.match(/\d+(?= entries)/)[0] : 0}
    end

    def wait_for_elements
      super
      @wait_on << :title
      @wait_on << :entries_text
      @wait_on << :next_button << :previous_button
    end
  end
end
