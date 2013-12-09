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

module OLE_QA::Framework::DocStore
  # The base page object for a given set of DocStore search results.
  # @note Elements in the search results will be vastly different depending on the
  #   type of search performed.  If it matters, then be sure to use the subclass
  #   for the type of search results you are expecting.
  class Results < OLE_QA::Framework::Page
    def initialize(ole_session)
      url = ole_session.docstore_url + 'discovery.do'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:revise_search_button)                      {b.button(:id => 'Back')}
      element(:new_search_button)                         {b.button(:name => 'newSearch')}
      element(:page_field)                                {b.text_field(:id => 'pageSpinner')}
      element(:go_to_page_button)                         {b.button(:id => 'gotoPage')}
      element(:page_list)                                 {b.div(:id => 'pageList').b}
      element(:no_results)                                {b.div(:id => 'demo2').b(:text => /^([Nn]o).*(results)/)}
    end

    def wait_for_elements
      super
      @wait_on << :revise_search_button
    end

    def set_functions
      super
      # Title bar for a given record, ordered by appearance on the screen (1-based).
      # @note Not reliable as a source of textual information!  If there is any highlighting
      #   on this element, the text will be broken up by a <span></span> wherever the
      #   highlighting is applied.
      function(:title_bar)                                { |which| which -= 1 ; b.h3(:class => 'expand', :index => "#{which}").a(:title => 'Expand/Collapse')}
      # Check if results are present and return true or false.
      function(:any_results?)                             { no_results.present? ? false : true}
      # Check if there is more than one page of results listed and return true or false.
      function(:multiple_pages?)                          { page_field.present? }
    end
  end
end