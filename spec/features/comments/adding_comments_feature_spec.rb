require 'rails_helper'

describe 'adding comments' do
	before(:each) do
		@user = create(:user)
		@user.posts.create(title: "Test title")
	end

	context 'when not signed in' do
		it 'user cannot leave a comment' do
			visit '/posts'
			find('.comments-link').click
			expect(page).to have_content "Password"
		end
	end

	context 'when signed in' do
		before(:each) do
			login_as @user
		end

		it 'user can add a comment' do
			visit '/posts'
			find('.comments-link').click
			fill_in 'Comment', with: "Cheesy chips"
			click_button 'Submit'
			expect(page).to have_content 'Cheesy chips'
		end
	end
end