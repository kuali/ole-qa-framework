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


describe "The Watir Webdriver" do

  before :all do
    @ole = OLE_QA::Framework.new
  end

  after :all do
    @ole.quit
  end

  it 'should create an instance of Watir Webdriver' do
    @ole.browser.class.should == Watir::Browser
  end

  it "should be able to open Google" do
    @ole.browser.goto("http://www.google.com")
    @ole.browser.title.should == "Google"
  end
end