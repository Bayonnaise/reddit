require 'rails_helper'

describe 'users' do
	context 'when not signed in' do
		it 'user can sign in' do
			logout
			visit '/posts'
			expect(page).not_to have_link 'Sign out'
			expect(page).to have_link 'Sign in'
		end
	end

	context 'when signed in' do
		let(:user) { create(:user, username: 'Testuser') }
		let(:user2) { create(:user2) }

		it 'user can sign out' do
			login_as user
			visit '/posts'
			expect(page).not_to have_link 'Sign in'
			expect(page).to have_link 'Sign out'
		end

		it 'can view a user page with their posts and comments' do
			login_as user
			user.posts.create(title: "Test post")
			user2.posts.create(title: "Hello world")
			user.comments.create(text: "elephant", post_id: Post.last.id)
			visit '/posts'
			click_link 'Testuser'
			expect(page).to have_content "Testuser"
			expect(page).to have_content "Joined reddit"
			expect(page).to have_content 'Test post'
			expect(page).to have_content 'elephant'
		end
	end
end