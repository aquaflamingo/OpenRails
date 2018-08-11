require 'faker'

FactoryBot.define do
	factory :topic do
		title {Faker::SiliconValley.app}
		description {Faker::SiliconValley.quote}
		max_units 2
	end
end