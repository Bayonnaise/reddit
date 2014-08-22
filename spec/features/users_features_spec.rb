require 'rails_helper'

describe 'users' do
	let(:user) { create(:user) }

	context 'when not signed in' do
		it 'user can sign in' do
			logout
			visit '/posts'
			expect(page).not_to have_link 'Sign out'
			expect(page).to have_link 'Sign in'
		end
	end

	context 'when signed in' do
		it 'user can sign out' do
			login_as user
			visit '/posts'
			expect(page).not_to have_link 'Sign in'
			expect(page).to have_link 'Sign out'
		end
	end
end