require 'rails_helper'

RSpec.describe Topic, type: :model do
	it "has a valid factory" do
		create(:topic).should be_valid
	end

	it "is invalid without a title" do
		build(:topic, title: nil).should_not be_valid
	end

	it "is invalid without a description" do
		build(:topic, description: nil).should_not be_valid
	end

	it "is invalid without a unit count" do
		build(:topic, max_units: nil).should_not be_valid
	end

end
