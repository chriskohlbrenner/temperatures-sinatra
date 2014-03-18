require_relative '../spec_helper'

describe BlogsController do

  describe 'GET /' do

    before do
      Post.create(:title => "Test Post", :content => "Test Post")
      get '/'
    end

    # is the content in the body at all
    # is the status 200 / or whatever
    # are the headers what I expected?
    it 'sends a 200 status code' do
      expect(last_response).to be_ok
    end

    it 'includes the blog posts title in the body' do
      expect(last_response.body).to include("Test Post")
    end

  end

  describe 'POST /posts' do
    before do
      post '/posts', {:title => "Something Different", :content => "Stuff"}
    end

    it 'saved the post to the database' do
      expect(Post.find_by(:title => "Something Different")).to be_a(Post)
    end

    it 'is a redirect to the homepage' do
      expect(last_response.location).to eq("http://example.org/")
    end
  end
end
