require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'validations' do
  	it 'title cannot be blank' do
  		post = Post.create(title: '', text: 'test')
  		expect(post).to have(1).error_on(:title) 
  	end
  end
end
