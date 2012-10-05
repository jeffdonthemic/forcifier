require 'spec_helper'
require 'json'

describe Forcifier do

	it "should deforce field names with __c correctly" do
		fields = Forcifier::FieldMassager.deforce_fields('id,name,field1__c')
		fields.should == 'id,name,field1'
	end

	it "should deforce fields names with capital letters to lowercase" do
		fields = Forcifier::FieldMassager.deforce_fields('id,name,FIELD1__c')
		fields.should == 'id,name,field1'
	end

	it "should enforce non-standard fields correctly" do
		fields = Forcifier::FieldMassager.enforce_fields('id,field1,name,field2')
		fields.should == 'id,field1__c,name,field2__c'
	end

	it "should deforce json correctly" do
		json = [{'name' => 'jeffdonthemic', 'total_wins__c' => 4}]
		pretty_json = Forcifier::JsonMassager.deforce_json(json)
		pretty_json.should == [{'name' => 'jeffdonthemic', 'total_wins' => 4}]
	end

	it "should deforce json with related json correctly" do
		json = [{'name' => 'jeffdonthemic', 'total_wins__c' => 4}, 'challenges__r' => {'name' => 'some challenge', 'prize__c' => 1001}]
		pretty_json = Forcifier::JsonMassager.deforce_json(json)
		pretty_json.should == [{'name' => 'jeffdonthemic', 'total_wins' => 4}, 'challenges__r' => {'name' => 'some challenge', 'prize' => 1001}]
	end

	it "should deforce json with remote json correctly" do
    files = %w(1792 1792_results challenges challenges_ruby romin)

    files.each do |file|
      json = JSON.parse(File.read("spec/lib/#{file}.json"))
      pretty_json = Forcifier::JsonMassager.deforce_json(json)
      pretty_json.should == JSON.parse(File.read("spec/lib/#{file}_deforced.json"))
    end
	end
end
