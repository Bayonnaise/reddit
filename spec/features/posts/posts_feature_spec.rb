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
      expect(page).to have_link 'Submit a new text post'
      expect(page).to have_link 'Submit a new link'
    end
  end

  context 'posts have been added' do
    before(:each) do
      Post.create(title: 'Test title', text: 'This is the body')
    end

    it 'should display them' do
      visit '/posts'
      expect(page).to have_content 'Test title'
    end
  end
end