# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@admin = User.create(:email => "admin@surveybuilder.com", :password => "admin123", :password_confirmation => "admin123")
@admin.admin = true
@admin.save

@surveytaker = User.create(:email => "user@surveybuilder.com", :password => "user1234", :password_confirmation => "user1234")
@surveytaker.admin = false
@surveytaker.save