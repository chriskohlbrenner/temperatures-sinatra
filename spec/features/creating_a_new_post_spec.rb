require_relative '../feature_helper'

describe "Creating a new post", :type => :feature do
  before do
    visit '/posts/new'

    fill_in "Title", :with => 'Post Title'
    fill_in "Content", :with => "Post Content"

    click_button "Submit"
  end
  
  it 'saves the post to the database' do
    expect(Post.find_by(:title => "Post Title")).to be_a(Post)
  end

  it 'redirects back to the homepage' do
    expect(current_path).to eq("/")
  end

  it 'includes people in their secrets.' do
    expect(page.body).to include "Post Title"
  end
end
