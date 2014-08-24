reddit
======
**Week 9 Friday challenge**

Objectives
--
Build a simple Reddit clone using Rails. Include tabs for sorting the posts by the usual metrics (Hot, Top, Rising, New etc), and allow logged in users to add and rate posts. Posts can be text or a link.

Development status
--
[![Code Climate](https://codeclimate.com/github/Bayonnaise/reddit/badges/gpa.svg)](https://codeclimate.com/github/Bayonnaise/reddit)
[![Test Coverage](https://codeclimate.com/github/Bayonnaise/reddit/badges/coverage.svg)](https://codeclimate.com/github/Bayonnaise/reddit)
Try the [latest build on Heroku]

- Users, posts, comments and votes are implemented and tested.
- You can sort by most popular or newest posts.
- Every user has a profile page that lists their posts and comments.
- URLs are automatically formatted to avoid broken link posts.

Next steps
--
- Finish Bootstrap styling
- Associate users with votes
- Stop users voting on a post multiple times

Tools used
--
- Ruby/Rails
- JavaScript/Jquery
- Bootstrap
- Heroku
- ActiveRecord and postgresql
- Gems inc Devise, FactoryGirl, Poltergeist, database_cleaner

[latest build on Heroku]:http://reddit-clone.herokuapp.com/