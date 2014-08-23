# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Vote.destroy_all


matt = User.create(username: 'chunkyChunk', email: 'matt@matt.com', password: '12345678', password_confirmation: '12345678')
steve = User.create(username: 'bigbadsteve', email: 'steve@steve.com', password: '12345678', password_confirmation: '12345678')
phil = User.create(username: 'redditRobot', email: 'phil@phil.com', password: '12345678', password_confirmation: '12345678')
amy = User.create(username: 'geekgrrrrl', email: 'amy@amy.com', password: '12345678', password_confirmation: '12345678')
sally = User.create(username: 'redditlover', email: 'sally@sally.com', password: '12345678', password_confirmation: '12345678')


matt.posts.create(title: 'Hello world!', text: 'This is a test post')
matt.posts.create(title: 'Doppelgrammers is the only doppelganger site you need', url: 'http://doppelgrammer.herokuapp.com')
steve.posts.create(title: "Blade Runner isn't as good as everyone says it is.", text: "I've... seen things you people wouldn't believe... Attack ships on fire off the shoulder of Orion. I watched c-beams glitter in the dark near the Tannhäuser Gate. All those... moments... will be lost in time, like [small cough] tears... in... rain. Time... to die...")
phil.posts.create(title: 'You should sign up for Makers Academy', url: 'http://www.makersacademy.com')
amy.posts.create(title: "I wish someone would make Rock Paper Scissors for me", text: "No one has ever made it")
sally.posts.create(title: "This Rock Paper Scissors game is boring", url: "http://fathomless-plateau-5364.herokuapp.com/")
steve.posts.create(title: "Guys, Shitstream is much better than reddit", url: "http://fast-plateau-8582.herokuapp.com/")

amy.comments.create(text: "I really agree with you, can we be friends? Please?!", post_id: Post.find_by(title: "Blade Runner isn't as good as everyone says it is.").id)