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

describe 'The Patron Factory' do

  it 'should have a patron matrix' do
    OLE_QA::Framework::Patron_Factory.patron_matrix.should be_an(Array)
  end

  it 'should select a patron record' do
    patron = OLE_QA::Framework::Patron_Factory.select_patron
    patron.should be_a(Hash)
    patron.should include(:id, :first, :last, :barcode)
  end

  it 'should have a borrower type array' do
    OLE_QA::Framework::Patron_Factory.borrower_types.should be_an(Array)
  end

  it 'should have a states array' do
    OLE_QA::Framework::Patron_Factory.states.should be_an(Array)
  end

  it 'should return a new patron' do
    patron = OLE_QA::Framework::Patron_Factory.new_patron
    patron.should be_a(Hash)
    patron[:first].should         =~ /[A-Z]{1}[a-z]+/
    patron[:last].should          =~ /[A-Z]{1}[a-z]+/
    patron[:barcode].should       =~ /[0-9]+/
    patron[:borrower_type].should =~ /[A-Z,a-z]+/
    patron[:address].should       =~ /[0-9]+\s[A-Z]{1}[a-z]+\s[A-Z]{1}[a-z]{1}/
    patron[:city].should          =~ /[A-Z]{1}[a-z]+/
    patron[:state].should         =~ /[A-Z]+/ || /[A-Z]+\s[A-Z]+/
    patron[:postal_code].should   =~ /[0-9]{5}/
    patron[:phone].should         =~ /[0-9]{3}\-[0-9]{3}\-[0-9]{4}/
    patron[:email].should         =~ /[A-Z,a-z]+\@[a-z]+\.[a-z]{3}/
  end
end
