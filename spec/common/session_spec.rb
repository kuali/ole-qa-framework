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

require 'rspec'
require 'spec_helper'

describe 'An OLE QA Framework Session' do

  before :all do
    @ole          = OLE_QA::Framework::Session.new(:headless? => false)
    @browser      = Watir::Browser.new :firefox
    @ole_alt      = OLE_QA::Framework::Session.new(:browser => @browser)
  end

  after :all do
    @ole.quit unless @ole.nil?
    @browser.quit unless @browser.nil?
    @ole_alt.quit unless @ole_alt.nil?
  end

  context 'should start' do
    it 'normally' do
      expect(@ole).to be_an(OLE_QA::Framework::Session)
    end

    it 'with a URL reader attribute' do
      expect(@ole.url).to be_a(String)
    end

    it 'with a docstore URL reader attribute' do
      expect(@ole.docstore_url).to be_a(String)
    end

    it 'with a predefined Watir-Webdriver session' do
      expect(@ole_alt.browser).to eq(@browser)
    end
  end

  context 'with options' do
    it 'in a reader attribute' do
      expect(@ole.options).to be_a(Hash)
    end
  end

  it 'with a Selenium Firefox profile' do
    profile = Selenium::WebDriver::Firefox::Profile.new
    ole     = OLE_QA::Framework::Session.new(:profile => profile)
    ole.quit unless ole.nil?
    expect(ole).to be_a(OLE_QA::Framework::Session)
  end
end