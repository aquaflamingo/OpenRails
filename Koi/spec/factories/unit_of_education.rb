require 'faker'

FactoryBot.define do
	factory :unit_of_education do
		title {Faker::SiliconValley.invention}
		description {Faker::SiliconValley.quote}
		points 2
	end
end