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

describe 'The string factory' do

  it 'should give an alphabetic string' do
    str = OLE_QA::Framework::String_Factory.alpha(5)
    str.length.should eq(5)
    str.should =~ /[A-Z]{5}/
  end

  it 'should give a numeric string' do
    str = OLE_QA::Framework::String_Factory.numeric(5)
    str.length.should eq(5)
    str.should =~ /[0-9]{5}/
  end

  it 'should should give an alphanumeric string' do
    str = OLE_QA::Framework::String_Factory.alphanumeric(5)
    str.length.should eq(5)
    str.should =~ /[A-Z,0-9]{5}/
  end

  it 'should give a telephone number' do
    str = OLE_QA::Framework::String_Factory.phone
    str.length.should eq(12)
    str.should =~ /555\-[0-9]{3}\-[0-9]{4}/
  end

  it 'should give a price' do
    price = OLE_QA::Framework::String_Factory.price
    price.should =~ /\d{1,3}\.0{2}/
  end
end