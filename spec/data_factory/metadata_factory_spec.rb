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

end
