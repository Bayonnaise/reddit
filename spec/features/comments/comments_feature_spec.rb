require 'rails_helper'

describe 'comments' do
	before(:each) do
		user = create(:user, username: "gorilla")
		login_as user
		user.posts.create(title: "Test title")
		user.comments.create(text: "elephant", post_id: Post.last.id)
	end

	context 'viewing comments' do
		it 'user can view the comments on a post' do
			visit '/posts'
			click_link 'comment'
			expect(page).to have_content('elephant')
		end

		it 'user can see who left each comment' do
			visit '/posts'
			click_link 'comment'
			expect(page).to have_content ('gorilla')
		end

		it 'user can see how many comments a post has without opening it' do
			visit '/posts'
			expect(page).to have_content '1 comment'
		end
	end
end