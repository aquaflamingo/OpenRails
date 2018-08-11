require 'rails_helper'

RSpec.describe UnitOfEducation, type: :model do
	it "has a valid factory" do
		create(:unit_of_education).should be_valid
	end

	it "is invalid without a title" do
		build(:unit_of_education, title: nil).should_not be_valid
	end

	it "is invalid without a point count" do
		build(:unit_of_education, points: nil).should_not be_valid
	end

end