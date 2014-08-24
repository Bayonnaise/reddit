require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'validations' do
  	it 'title cannot be blank' do
  		post = Post.create(title: '', text: 'test')
  		expect(post).to have(1).error_on(:title) 
  	end
  end

  context 'counting votes' do
  	let(:post) { create(:post) }

  	before(:each) do
  		2.times { post.votes << Vote.create(direction: 'up') }
  		post.votes << Vote.create(direction: 'down') 
  	end

  	it 'can count the upvotes' do
  		expect(post.count_upvotes).to eq 2
  	end	

  	it 'can count the downvotes' do
  		expect(post.count_downvotes).to eq 1
  	end	

  	it 'can calculate the net vote tally' do
  		expect(post.count_netvotes).to eq 1
  	end
  end

  context 'handling urls' do
    it 'can extract the domain from a url' do
      post = create(:post, url: 'http://www.google.com/test-string5678')
      expect(post.get_domain).to eq 'google.com'
    end

    it "adds http:// if it isn't already there" do
      post = create(:post, url: 'www.google.com/test-string5678')
      expect(post.url).to eq 'http://www.google.com/test-string5678'
    end
  end
end
