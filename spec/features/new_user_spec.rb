require_relative '../feature_helper'

describe "Registering for the site", :type => :feature do
  before do
    visit '/users/new'

    fill_in "Name", :with => 'Flatiron Student'
    fill_in "Email", :with => "student@flatironschool.com"
    fill_in "Password", :with => "flatiron"

    click_button "Submit"

    # @user = User.find_by(:name => "Flatiron Student")
  end
  
  it 'redirects to the users page' do
    expect(current_path).to eq("/users/1")
  end

  it 'contains the users name on their page' do
    expect(page).to have_content("Flatiron Student")
  end

end