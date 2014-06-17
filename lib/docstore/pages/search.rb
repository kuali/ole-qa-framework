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

module OLE_QA::Framework::DocStore
  # The search page for the OLE Document Store.
  class Search < OLE_QA::Framework::Page
    def initialize(ole_session)
      url = ole_session.docstore_url + 'discovery.do?searchType=newSearch'
      super(ole_session, url)
    end

    def set_elements
      super
      element(:category_selector)                           {b.select_list(:id => 'documentCategory')}
      element(:type_selector)                               {b.select_list(:id => 'documentType')}
      element(:format_selector)                             {b.select_list(:id => 'documentFormat')}
      element(:sort_selector)                               {b.select_list(:id => 'sorting_order')}
      element(:search_field_1)                              {b.text_field(:name => 'st')}
      element(:search_field_2)                              {b.text_field(:name => 'st1')}
      element(:search_field_3)                              {b.text_field(:name => 'st2')}
      element(:search_field_4)                              {b.text_field(:name => 'st3')}
      element(:search_field_5)                              {b.text_field(:name => 'st4')}
      element(:scope_selector_1)                            {b.select_list(:name => 'searchScope')}
      element(:scope_selector_2)                            {b.select_list(:name => 'searchScope1')}
      element(:scope_selector_3)                            {b.select_list(:name => 'searchScope2')}
      element(:scope_selector_4)                            {b.select_list(:name => 'searchScope3')}
      element(:scope_selector_5)                            {b.select_list(:name => 'searchScope4')}
      element(:field_selector_1)                            {b.select_list(:name => 'searchField')}
      element(:field_selector_2)                            {b.select_list(:name => 'searchField1')}
      element(:field_selector_3)                            {b.select_list(:name => 'searchField2')}
      element(:field_selector_4)                            {b.select_list(:name => 'searchField3')}
      element(:field_selector_5)                            {b.select_list(:name => 'searchField4')}
      element(:search_button)                               {b.button(:class => 'searchButton')}
      element(:clear_button)                                {b.button(:name => 'Clear')}
    end

    def wait_for_elements
      super
      @wait_on << :search_field_1
      @wait_on << :search_field_5
      @wait_on << :search_button
    end

    def set_functions
      super
      # The 'AND' join operator option for a given search line.
      # @note Integer should be between 1 and 3, corresponding to the operator line.
      #   Each operator line affects the next search query line in sequence,
      #   (i.e., .and_option(1) affects search_field_2)
      function(:and_option)                                 { |which = 1| which -= 1 ; b.radio(:name => "operator#{which}", :index => 0)}

      # The 'OR' join operator option for a given search line.
      #   Each operator line affects the next search query line in sequence,
      #   (i.e., .or_option(1) affects search_field_2)
      function(:or_option)                                  { |which = 1| which -= 1 ; b.radio(:name => "operator#{which}", :index => 1)}

      # The 'NOT' join operator option for a given search line.
      #   Each operator line affects the next search query line in sequence,
      #   (i.e., .not_option(1) affects search_field_2)
      function(:not_option)                                 { |which = 1| which -= 1 ; b.radio(:name => "operator#{which}", :index => 2)}
    end
  end
end