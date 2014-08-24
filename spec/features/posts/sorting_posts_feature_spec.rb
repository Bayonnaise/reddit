require 'rails_helper'

describe 'sorting posts' do
	let(:user) { create(:user) }

	before(:each) do
		login_as user
		user.posts.create(title: "Posted first")
		user.posts.create(title: "Posted second")
		user.posts.create(title: "Posted third")
	end

	it 'can sort posts newest first' do
		visit '/posts/newest'
		expect(page.body.index("Posted third")).to be < (page.body.index("Posted second"))
		expect(page.body.index("Posted second")).to be < (page.body.index("Posted first"))
	end

	it 'can sort posts by votes' do
		Post.find_by(title: "Posted second").votes << Vote.new(direction: 'up')
		Post.find_by(title: "Posted second").votes << Vote.new(direction: 'up')
		Post.find_by(title: "Posted third").votes << Vote.new(direction: 'up')
		visit '/posts/top'
		expect(page.body.index("Posted second")).to be < (page.body.index("Posted third"))
		expect(page.body.index("Posted third")).to be < (page.body.index("Posted first"))
	end

	it 'can sort posts by comments' do
		Post.find_by(title: "Posted third").comments << Comment.new(text: 'comment 1')
		Post.find_by(title: "Posted third").comments << Comment.new(text: 'comment 2')
		Post.find_by(title: "Posted first").comments << Comment.new(text: 'comment 3')
		visit '/posts/commented'
		expect(page.body.index("Posted third")).to be < (page.body.index("Posted first"))
		expect(page.body.index("Posted first")).to be < (page.body.index("Posted second"))
	end
end