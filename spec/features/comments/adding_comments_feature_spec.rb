require 'rails_helper'

describe 'adding comments' do
	before(:each) do
		@user = create(:user)
		@user.posts.create(title: "Test title")
		post = Post.first
		post.comments.create(text: "elephant")
	end

	context 'when not signed in' do
		it 'user cannot leave a comment' do
			visit '/posts'
			click_link 'comment'
			expect(page).to have_content "Password"
		end
	end

	context 'when signed in' do
		before(:each) do
			login_as @user
		end

		it 'user can add a comment' do
			visit '/posts'
			click_link 'comment'
			fill_in 'Comment', with: "Cheesy chips"
			click_button 'Submit'
			expect(page).to have_content 'Cheesy chips'
		end
	end
end