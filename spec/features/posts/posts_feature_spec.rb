require 'rails_helper'

describe 'viewing posts' do
	before(:each) do
		user = create(:user)
		login_as user
	end

	context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Submit text post'
      expect(page).to have_link 'Submit link post'
    end
  end

  context 'posts have been added' do
    before(:each) do
      Post.create(title: 'Test title', text: 'This is the body')
    end

    it 'should display them' do
      visit '/posts'
      expect(page).to have_link 'Test title'
    end

    it 'user can click through to read the text of a post' do
      visit '/posts'
      click_link 'Test title'
      expect(page).to have_content 'This is the body'
    end
  end
end