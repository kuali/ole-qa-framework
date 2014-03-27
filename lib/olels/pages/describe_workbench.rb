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
  # The OLE Library System Describe Workbench screen (implemented in 1.5.0-M2-r18095, 2014-03-20)
  class Describe_Workbench < Lookup
    def initialize(ole_session)
      url = ole_session.url + 'portal.do?channelTitle=Describe%20Workbench&channelUrl='
      url += ole_session.url + 'ole-kr-krad/olesearchcontroller?viewId=OLESearchView&methodToCall=start'
      super(ole_session,url)
    end

    def set_elements
      super
      element(:document_type_selector)                      {b.select_list(:id => 'DocumentAndSearchSelectionType_DocType_control')}
      element(:search_type_selector)                        {b.select_list(:id => 'DocumentAndSearchSelectionType_SearchType_control')}
      element(:search_button)                               {b.button(:id => 'SearchButton')}
      element(:clear_button)                                {b.button(:id => 'ClearButton')}
      element(:new_search_button)                           {b.button(:id => 'StartSearchButton')}
      element(:error_message)                               {b.li(:class => 'uif-errorMessageItem')}
      element(:export_xml_button)                           {b.button(:id => 'exportToXml')}
      element(:next)                                        {b.a(:text => /[Nn]ext/)}
      element(:previous)                                    {b.a(:text => /[Pp]revious/)}
    end

    def wait_for_elements
      super
      @wait_on << :document_type_selector << :search_button
    end

    def set_functions
      super
      # Check if text is present in results.  (Will not search titles.)
      function(:text_in_results)                            {|which| b.span(:class => 'uif-readOnlyContent', :text => /#{which}/)}
      function(:text_in_results?)                           {|which| text_in_results(which).present?}
      # Check if title is present in results.
      function(:title_in_results)                           {|which| b.a(:class => 'uif-link',:text => /#{which}/)}
      function(:title_in_results?)                          {|which| title_in_results(which).present?}
      # Return the select checkbox for a line in the search results containing the given text.  (Will not work with titles.)
      function(:select_by_text)                             {|which| text_in_results(which).parent.parent.parent.td(:index => 0).div(:class => 'uif-inputField').checkbox(:class => 'uif-checkboxControl')}
      # Return the select checkbox for a line in the search results containing the given text.
      function(:select_by_title)                            {|which| title_in_results(which).parent.parent.parent.td(:index => 0).div(:class => 'uif-inputField').checkbox(:class => 'uif-checkboxControl')}
    end

    def set_lines
      set_line(:search_line, OLE_QA::Framework::OLELS::Workbench_Line)
    end
  end
end