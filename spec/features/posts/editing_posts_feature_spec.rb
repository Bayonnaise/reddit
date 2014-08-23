require 'rails_helper'

describe 'editing posts' do
	context 'not logged in' do
		it 'user cannot edit a post' do
			visit '/posts'
			expect(page).not_to have_link 'edit'
		end
	end

	context 'logged in' do
		before(:each) do
			@user1 = create(:user)
			@user2 = create(:user2)
			login_as @user1
		end

		it 'user can edit own posts' do
			@user1.posts.create(title: 'Test title')
			visit '/posts'
			click_link 'edit'
			fill_in 'post_title', with: 'Changed the title'
			click_button 'Submit'
			expect(page).to have_content 'Changed the title'
		end

		it 'user cannot edit the posts of others' do
			@user2.posts.create(title: 'Test title')
			visit '/posts'
			expect(page).not_to have_link 'edit'
		end
	end
end

describe 'deleting posts' do
	context 'not logged in' do
		it 'user cannot delete a post' do
			visit '/posts'
			expect(page).not_to have_link 'delete'
		end
	end

	context 'logged in' do
		before(:each) do
			@user1 = create(:user)
			@user2 = create(:user2)
			login_as @user1
		end

		it 'user can delete own posts' do
			@user1.posts.create(title: 'Test title', text: 'This is the body')
			visit '/posts'
			click_link 'delete'
			expect(page).not_to have_content 'Test title'
		end

		it 'user cannot edit the posts of others' do
			@user2.posts.create(title: 'Test title', text: 'This is the body')
			visit '/posts'
			expect(page).not_to have_link 'delete'
		end
	end
end