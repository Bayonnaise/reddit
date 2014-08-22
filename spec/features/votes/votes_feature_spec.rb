require 'rails_helper'

describe 'votes' do
	before(:each) do
		@user = create(:user)
		Post.create(title: 'Test title')
	end

	context 'when not logged in' do
		it 'user cannot upvote posts' do
			visit '/posts'
			click_link 'Upvote'
			expect(page).to have_content 'Password'
		end

		it 'user cannot downvote posts' do
			visit '/posts'
			click_link 'Downvote'
			expect(page).to have_content 'Password'
		end
	end
end