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

describe 'The Bib Record Factory' do

  it 'should create a barcode' do
    barcode = OLE_QA::Framework::Bib_Factory.barcode
    barcode.should be_a(String)
    barcode.length.should_not > 18
  end

  it 'should create an LCC call number' do
    cn = OLE_QA::Framework::Bib_Factory.call_number('LOC')
    cn.should be_a(String)
    cn.should =~ /[A-Z]{1,2}[0-9]{1,4}\ \.[A-Z][0-9]{1,3}/
  end

  it 'should create a title' do
    title = OLE_QA::Framework::Bib_Factory.title(8..12)
    title.should                  be_a(String)
    title.should                  =~ /[A-Z][a-z]{7,11}+/
    specific_title = OLE_QA::Framework::Bib_Factory.title(6)
    specific_title.should         be_a(String)
    specific_title.length.should  eq(6)
  end

  it 'should create an author' do
    author = OLE_QA::Framework::Bib_Factory.author(4..6,8..12)
    author.should                 be_a(String)
    author.should                 =~ /[A-Z][a-z]{3,5} [A-Z][a-z]{7,11}/
    specific_author = OLE_QA::Framework::Bib_Factory.author(4,8)
    specific_author.should        =~ /[A-Z][a-z]{3} [A-Z][a-z]{7}/
  end

  it 'should return a circulation info hash' do
    circ_info = OLE_QA::Framework::Bib_Factory.circulation_info
    circ_info[:code].should         be_a(String)
    circ_info[:locations].should    be_an(Array)
  end

  it 'should select a circulation info hash by desk code' do
    circ_info = OLE_QA::Framework::Bib_Factory.circulation_info('BL_EDUC')
    circ_info[:code].should         be_a(String)
    circ_info[:locations].should    be_an(Array)
  end

  it 'should raise an error if asked for a desk code that does not exist' do
    lambda {OLE_QA::Framework::Bib_Factory.circulation_info('Plugh')}.should raise_error(OLE_QA::Framework::Error,'No circulation desk found. Given: Plugh')
  end
end