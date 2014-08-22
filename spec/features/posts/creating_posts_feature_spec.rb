require 'rails_helper'

describe 'creating posts' do
	let(:user1) { create(:user) }

	context 'when not logged in' do
		it 'user cannot create a post' do
			visit '/posts'
			expect(page).not_to have_link 'Submit link post'
		end
	end

	context 'when logged in' do
		before(:each) do
			login_as user1
		end

		it 'user can add a text post and see it displayed' do
			visit '/posts'
			click_link 'Submit text post'
			save_and_open_page
			fill_in 'post_title', with: 'Test title'
			fill_in 'post_text', with: 'Some body text'
			click_button 'Submit'
			expect(page).to have_content 'Test title'
		end

		it 'user can add a link post and see it displayed' do
			visit '/posts'
			click_link 'Submit link post'
			fill_in 'post_title', with: 'Test title'
			fill_in 'post_url', with: 'http://www.reddit.com'
			click_button 'Submit'
			expect(page).to have_link('Test title', href: 'http://www.reddit.com')
		end

		it 'user cannot add a post without a title' do
			visit 'posts/new'
			click_button 'Submit'
			expect(page).to have_content 'error'
		end
	end
end