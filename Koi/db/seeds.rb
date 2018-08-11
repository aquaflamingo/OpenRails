# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_rob = User.create :name=> "Richard Hendrix", :email => "richard@pp.com", :password => "password"

user_rob.topics.build(
		:title=>"Distributed Systems",
		:description=>"Learn how distributed systems works to save the internet!",
		:max_units=>2).save

topic_distb = Topic.find 1

topic_distb.unit_of_educations.build(
		:title=>"Wikipedia Page",
		:description=>"",
		:points=>2).save

topic_distb.unit_of_educations.build(
		:title=>"Read Gosh 2007 Paper",
		:description=>"Landmark paper on distributed systems.",
		:points=>2).save

user_rob.topics.build(
		:title=>"Full Stack Development",
		:description=>"Improving my Ruby on Rails Engineering.",
		:max_units=>3).save

full_stack = Topic.find 2

full_stack.unit_of_educations.build(
		:title=>"Learn Ruby",
		:description=>"Take codeacademy Ruby class.",
		:points=>1).save

full_stack.unit_of_educations.build(
		:title=>"Interview Ruby on Rails Engineer",
		:description=>"Contact and interview a Full Stack RoR Engineer.",
		:points=>3).save
