require 'rails_helper'

describe 'creating posts' do
	let(:user1) { create(:user) }

	context 'when not logged in' do
		it 'user cannot create a post' do
			visit '/posts'
			click_link 'Submit a new text post'
			expect(page).to have_content 'Password'
		end
	end

	context 'when logged in' do
		before(:each) do
			login_as user1
		end

		it 'user can add a text post and see it displayed' do
			visit '/posts'
			click_link 'Submit a new text post'
			fill_in 'Title', with: 'Test title'
			fill_in 'Text', with: 'Some body text'
			click_button 'Submit'
			expect(page).to have_content 'Test title'
			expect(page).to have_content 'Some body text'
		end

		it 'user can add a link post and see it displayed' do
			visit '/posts'
			click_link 'Submit a new link'
			fill_in 'Title', with: 'Test title'
			fill_in 'Url', with: 'http://www.reddit.com'
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