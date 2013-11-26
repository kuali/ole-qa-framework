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

require "rspec"
require "spec_helper"


describe "A Page" do

  before :all do
    @ole = OLE_QA::Framework::Session.new
    @page = OLE_QA::Framework::Page.new(@ole, @ole.base_url)

    class TestPage < OLE_QA::Framework::Page
      def initialize(ole_session)
        url        = 'http://www.google.com'
        lookup_url = '_DOC_ID_'
        super(ole_session, url, lookup_url)
      end

      def set_elements
        super
        element(:input)               {b.text_field(:id => 'gbqfq')}
        element(:button)              {b.button(:id => 'gbqfba')}
      end

      def wait_for_elements
        super
        @wait_on << :input << :button
      end
    end

    @google_page = TestPage.new(@ole)
  end

  after :all do
    @ole.quit
  end

  it "should open via url" do
    @page.open
    @ole.browser.title.should == "Kuali Portal Index"
  end

  it 'should have a browser accessor' do
    @page.browser.class.should == @ole.browser.class
  end

  it 'should have a URL attribute' do
    @page.url.should == @ole.base_url
  end

  it 'should have a lookup URL' do
    @google_page.lookup_url('21').should == @ole.base_url + '21'
  end

  it 'should wait for necessary elements to be present' do
    @google_page.open.should be_true
    @google_page.wait_for_page_to_load.should be_true
  end

  it 'should set elements on a subclass' do
    @google_page.elements.include?(:input).should be_true
    @google_page.elements.include?(:button).should be_true
  end

  it 'should be able to login as another user' do
    @page.open
    @page.login('ole-abeal').should be_true
  end

  it 'should be able to logout' do
    @page.logout.should be_true
  end

  it 'should raise an error if the login field is not present' do
    @ole.open('www.google.com')
    lambda {@page.login}.should raise_error(error=OLE_QA::Framework::Error)
  end

  it 'should set a frame element on the browser if one is present' do
    OLE_QA::Framework::OLEFS::Requisition.new(@ole).open
    @page.browser.class.should == Watir::Frame
  end
end
