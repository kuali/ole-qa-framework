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

describe 'A Headless session' do

  before :all do
    @ole = OLE_QA::Framework::Session.new(:headless? => true)
  end

  after :all do
    @ole.quit
  end

  it 'should be available in an instance method' do
    expect(@ole.headless_session).to be_an_instance_of(Headless)
  end

  it 'should be available in a class method' do
    expect(OLE_QA::Framework::Session.headless_session).to eq(@ole.headless_session)
  end

  it 'should show as started on an instance' do
    expect(@ole.is_headless?).to be_true
  end

  it 'should show as started on the class' do
    expect(OLE_QA::Framework::Session.is_headless?).to be_true
  end

  it 'should keep running if a new Headless session is requested' do
    original_session = @ole.headless_session.inspect
    @ole = OLE_QA::Framework::Session.new(:headless? => true)
    expect(original_session).to eq(@ole.headless_session.inspect)
  end

  it 'should stop if a new non-Headless session is requested' do
    ole = OLE_QA::Framework::Session.new(:headless? => false)
    ole.close
    expect(ole.is_headless?).to be_false
  end

  it 'will not be used with a pre-existing Watir session' do
    browser = Watir::Browser.new
    ole = OLE_QA::Framework::Session.new(:browser => browser)
    ole.close
    expect(ole.is_headless?).to be_false
  end

end