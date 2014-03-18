require_relative '../spec_helper'

describe UsersController do

  describe 'GET /users/new' do

    before do
      get '/users/new'
    end

    it 'sends a 200 status code' do
      expect(last_response).to be_ok
    end

  end  

  describe 'POST /users' do
    let(:valid_attributes){
      {
        :name => "Flatiron Student",
        :email => "student@flatironschool.com",
        :password => "flatiron"
      }
    }

    before do
      post '/users', valid_attributes
    end

    it 'sends a 302 status code' do
      expect(last_response).to be_a_redirect
    end

    it 'created a user in the database' do
      expect(User.count).to eq(1)
    end

  end
end