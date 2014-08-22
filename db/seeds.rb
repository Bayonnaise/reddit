# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all


matt = User.create(username: 'chunkylover', email: 'matt@matt.com', password: '12345678', password_confirmation: '12345678')
steve = User.create(username: 'bigbadtrevor', email: 'steve@steve.com', password: '12345678', password_confirmation: '12345678')
phil = User.create(username: 'redditRobot', email: 'phil@phil.com', password: '12345678', password_confirmation: '12345678')

matt.posts.create(title: 'Hello world!', text: 'This is a test post')
matt.posts.create(title: 'Doppelgrammers is the only doppelganger site you need', url: 'http://doppelgrammer.herokuapp.com')
steve.posts.create(title: 'How to make really dull test posts', text: 'Not much to see here')
phil.posts.create(title: 'You should sign up for Makers Academy', url: 'http://www.makersacademy.com')
