 require 'faker'


 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.
 
 # Create Posts
 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: '12345678',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com', 
   password: '12345678',
   role:     'member'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'migs910@hotmail.com',
   password: '12345678',
   role: "member"
 )
 member.skip_confirmation!
 member.save!

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: "12345678",
     role: "member"
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

# Create main_categories
 15.times do
   MainCategory.create!(
     title: Faker::Lorem.sentence,
     body:  Faker::Lorem.paragraph
   )
 end
main_categories = MainCategory.all

# Create Sub_categories
 50.times do
   SubCategory.create!(
     # user:   users.sample,
     main_category:  main_categories.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
sub_categories = SubCategory.all
 
# Create Items
 100.times do
      
   Item.create!(
     #user: users.sample,
     sub_category: sub_categories.sample,
     name:  Faker::Lorem.sentence,
     body: Faker::Lorem.paragraph
   )
 end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
