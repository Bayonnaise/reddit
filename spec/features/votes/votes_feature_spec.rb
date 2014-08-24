require 'rails_helper'

describe 'votes' do
	before(:each) do
		@user = create(:user)
		logout
	end

	context 'when not logged in' do
		before(:each) do
			@user.posts.create(title: 'Test title')
		end

		it 'user cannot upvote posts', js: true do
			visit '/posts'
			find('.upvote-link').click
			expect(page).to have_content 'Password'
		end

		it 'user cannot downvote posts', js: true do
			visit '/posts'
			find('.downvote-link').click
			expect(page).to have_content 'Password'
		end
	end

	context 'when logged in' do
		before(:each) do
			login_as @user
			@user2 = create(:user2)
		end

		it 'user can upvote posts', js: true do
			@user.posts.create(title: 'Test title')
			visit '/posts'
			expect(page).to have_css('.vote-count', text: '0')
			find('.upvote-link').click
			expect(page).to have_css('.vote-count', text: '1')
		end

		it 'user can downvote posts', js: true do
			@user.posts.create(title: 'Test title')
			visit '/posts'
			expect(page).to have_css('.vote-count', text: '0')
			find('.downvote-link').click
			expect(page).to have_css('.vote-count', text: '-1')
		end

		xit 'user cannot vote more than once on a post', js: true do
			@user2.posts.create(title: "Test title")
			visit '/posts'
			expect(page).to have_css('.vote-count', text: '0')
			find('.upvote-link').click
			expect(page).to have_css('.vote-count', text: '1')
			find('.upvote-link').click
			expect(page).to have_css('.vote-count', text: '1')
		end

		xit 'user cannot vote for own posts', js: true do
			@user2.posts.create(title: 'Test title')
			visit '/posts'
			find('.upvote-link').click
			expect(page).to have_css('.vote-count', text: '0')
		end
	end
end