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

  # This represents the base object for the Describe Editor.
  # It generates elements common to all three editor screens:
  # - Bibliographic Editor
  # - Instance Editor (for Holdings)
  # - Item Editor
  class Editor < OLE_QA::Framework::Page

    # The URL for this Page object is the universal Describe Editor URL in OLELS.
    # When the Editor is opened via URL, it will start on the
    # MARC Bibliographic Editor screen.
    #
    # NB:
    # The URL of the newly-opened editor instance
    # will differ from the URL with which the screen was
    # opened, so do not rely on URL equivalence tests
    # to verify whether or not the Editor has been opened
    # correctly.
    #
    def initialize(ole_session)
      editor_url =  ole_session.url + 'portal.do?channelTitle=Editor&channelUrl='
      editor_url += ole_session.url + 'ole-kr-krad/editorcontroller?viewId=EditorView&methodToCall=load&docCategory=work&docType=bibliographic&docFormat=marc&editable=true'
      super(ole_session, editor_url)
      set_lines if defined?(self.set_lines)
    end

    # Set elements common to all Editor screens.
    # @note "Return to Search" buttons will not appear when Editors are not invoked via Describe Workbench,
    #   despite their commonality.
    def set_elements
      super
      element(:title)                               {b.h2(:class => "uif-headerText").span}
      element(:message)                             {b.li(:class => 'uif-infoMessageItem')}
      element(:messages)                            {b.lis(:class => 'uif-infoMessageItem')}
      element(:message_header)                      {b.h3(:class => 'uif-pageValidationHeader')}
      element(:submit_button)                       {b.button(:id => "submitEditor")}
      element(:cancel_button)                       {b.button(:id => "cancelEditor")}
      element(:close_button)                        {b.button(:id => "closeEditor")}
      element(:return_to_search_button)             {b.button(:id => "returnToSearch_button")}
      # Navigation Area Elements
      element(:delete_bib_button)                   {b.div(:id => 'bibLevelActionSection').div(:index => 2).input(:title => "Delete Bib")}
      element(:add_instance_button)                 {b.div(:id => 'bibLevelActionSection').div(:index => 2).input(:title => "Add Instance")}
      # @note Vakata Context Menu items are only present on the screen after the containing menu header has been right-clicked.
      element(:delete_instance_button)              {b.div(:id => 'vakata-contextmenu').ul.li(:index => 0).a(:rel => "Delete")}
      element(:add_item_button)                     {b.div(:id => 'vakata-contextmenu').ul.li(:index => 2).a(:rel => 'Create')}
      element(:delete_item_button)                  {b.div(:id => 'vakata-contextmenu').ul.li(:index => 0).a(:rel => 'Delete')}
    end

    # Designate elements always expected to be present once the editor has finished loading.
    def wait_for_elements
      @wait_on << :title
    end

    # Define commonly-used functions on Editor page objects.
    def set_functions
      super
      # Click the submit button, wait until a message appears, and return the message text.
      function(:save_record)                        {submit_button.click ; message.wait_until_present ; message.text.strip}
      # Links for Holdings and Item Records - Pass a human-readable (1-based) variable to determine which instance of each link should be used.
      #   e.g., holdings_link(1) will return the first holdings link, holdings_link(2) will return the second.
      function(:holdings_link)                      {|which = 1| b.span(:xpath => "//div[@id='holdingsItemTree_tree']/ul[@class='jstree-no-icons']/li[#{which}]/a/span[@class='uif-message']")}
      function(:holdings_icon)                      {|which = 1| b.ins(:xpath => "//div[@id='holdingsItemTree_tree']/ul[@class='jstree-no-icons']/li[#{which}]/ins")}
      # This function takes two arguments - the first is the holdings element to which it belongs, and the second is its position.
      #   e.g., item_link(1,1) will return the first item under the first holdings link, item_link(2,2) will return the second item under the second holdings link.
      function(:item_link)                          {|which_holdings = 1, which_item = 1| b.a(:xpath => "//div[@id='holdingsItemTree_tree']/ul[@class='jstree-no-icons']/li[#{which_holdings}]/ul/li[#{which_item}]/a")}
      # Return the number of messages found in the .message_header text.
      #   - If .message_header is not present, a "0" will be returned.
      function(:message_count)                       { if message_header.present? then message_header.text.match(/\d(?=\smessage)/).to_s else "0" end}
    end
  end
end