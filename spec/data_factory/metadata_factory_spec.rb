require 'rspec'
require 'spec_helper.rb'

describe 'The Metadata Factory' do

  it 'should create a location code' do
    location = OLE_QA::Framework::Metadata_Factory.location_code
    location.should be_a(String)
    location.should =~ /^[A-Z]/
    location.should =~ /[A-Z,0-9]+/
    location.should =~ /\d/
  end

  it 'should create a randomized location' do
    location = OLE_QA::Framework::Metadata_Factory.new_location
    location.should be_a(Hash)
    location[:code].should be_a(String)
    location[:name].should be_a(String)
    location[:description].should be_a(String)
    location[:level].should eq('1')
    location[:parent].should be_nil
  end

  it 'should create a location with a level of 2 and a random parent' do
    location = OLE_QA::Framework::Metadata_Factory.new_location(2, OLE_QA::Framework::String_Factory.alpha(3))
    location[:level].should eq('2')
    location[:parent].should =~ /[A-Z]{3}/
  end

end
