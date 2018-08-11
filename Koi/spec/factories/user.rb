require 'faker'

FactoryBot.define do
	factory :user do
		name {Faker::SiliconValley.character}
		email {Faker::SiliconValley.email}
		password "password"
		password_confirmation "password"
	end
end