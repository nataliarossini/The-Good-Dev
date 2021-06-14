# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MyBadge.destroy_all
Badge.destroy_all
MySkill.destroy_all
Skill.destroy_all
Application.destroy_all
Review.destroy_all
Project.destroy_all
Organization.destroy_all
User.destroy_all
organization = Organization.new(
  name: 'Dunder Mifflin',
  registration: '1234567',
  url: 'dundermiflin.com',
  category: 'a' ,
  user_id: User.create(
  email: 'michael@email.com',
  password: '123456',
  first_name: 'Michael',
  last_name: 'Scott',
  user_type: :organization,
  description: 'Our organization help reduce deforestation by recicling paper',
  address: 'Scranton, Pa, USA'
  ).id
  )
organization.save!
# User.create(
#   email: 'michael@email.com',
#   password: '123456',
#   first_name: 'Michael',
#   last_name: 'Scott',
#   user_type: 'Organization',
#   description: 'Our organization help reduce deforestation by recicling paper',
#   address: 'Scranton, Pa, USA'
#   )
emma = User.create(
  email:'emma@abc.com',
  password: '1234567.',
  first_name: 'Emma',
  last_name: 'Cardon',
  user_type: :volunteer,
  description: "Freshly trained developer, I have experience teaching",
  address: 'London',
  github: 'https://github.com/',
  linkedin: 'https://www.linkedin.com/',
  )

user = User.create(
  email: 'kevin@email.com',
  password: '123456',
  first_name: 'Kevin',
  last_name: 'Malone',
  user_type: :volunteer,
  description: "I've worked as an accountant for many years and changed career recently, I'm now a developer...",
  address: 'New York, NY',
  github: 'https://github.com/',
  linkedin: 'https://www.linkedin.com/',
  )

Project.create(
  title: 'Saving trees',
  description: 'Create a app to have accountancy of how many trees our company saved',
  details: 'We need someone with javascript knowledge to help our project and develop an app that will show our user how many tres bla bla bla.. We provide your stay as well as breakfats etc',
  location: 'Scranton, Pa, USA',
  start_date: Time.now,
  end_date: 10.days.from_now,
  remote: true,
  organization_id: organization.id

  )

skills_list = ['Teamwork', 'Teaching', 'Ruby', 'Rails', 'Python', 'HTML', 'CSS', 'JavaScript', 'Front-end', 'Back-end']

skills_list.each { |e| Skill.create(name: e) }

badges = [ {name: "Reviewer", about: "review", condition: "when number of review made by user reaches to 10" },
           {name: "Experienced Host", about: "project", condition: "if number of approved applications >=10" },
           {name: "Top Rated", about: "review", condition: "if number of reviews made for user is >= 3 & average rating >=4.5" }]

badges.each { |b| Badge.create(name: b[:name], about: b[:about], condition: b[:condition]) }
