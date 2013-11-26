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

require 'rspec'
require 'spec_helper'

describe 'The Account Factory' do

  it 'should have an account matrix' do
    OLE_QA::Framework::Account_Factory.account_matrix.should be_a(Hash)
  end

  it 'should have an object matrix' do
    OLE_QA::Framework::Account_Factory.object_matrix.should be_a(Hash)
  end

  it 'should select an account' do
    acct = OLE_QA::Framework::Account_Factory.select_account
    acct.should be_an(Array)
    acct.count.should eq(2)
  end

  it 'should select an object code' do
    obj = OLE_QA::Framework::Account_Factory.select_object
    obj.should be_an(Array)
    obj.count.should eq(2)
  end
end