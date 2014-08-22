require 'rails_helper'

describe 'votes' do
	before(:each) do
		@user = create(:user)
		logout
	end

	context 'when not logged in' do
		before(:each) do
			create(:post)
		end

		it 'user cannot upvote posts', js: true do
			visit '/posts'
			click_link 'Upvote'
			expect(page).to have_content 'Password'
		end

		it 'user cannot downvote posts', js: true do
			visit '/posts'
			click_link 'Downvote'
			expect(page).to have_content 'Password'
		end
	end

	context 'when logged in' do
		before(:each) do
			login_as @user
			@user2 = create(:user2)
		end

		it 'user can upvote posts', js: true do
			create(:post)
			visit '/posts'
			expect(page).to have_css('.vote-count', text: '0')
			click_link 'Upvote'
			expect(page).to have_css('.vote-count', text: '1')
		end

		it 'user can downvote posts', js: true do
			create(:post)
			visit '/posts'
			expect(page).to have_css('.vote-count', text: '0')
			click_link 'Downvote'
			expect(page).to have_css('.vote-count', text: '-1')
		end

		xit 'user cannot vote for own posts', js: true do
			@user2.posts.create(title: 'Test title')
			visit '/posts'
			click_link 'Upvote'
			expect(page).to have_css('.vote-count', text: '0')
		end
	end
end