require 'rails_helper'

feature "Authenticates", :type => :feature do

  let(:new_user) {build(:user)}
  it 'can signup' do
    visit root_path
    click_link 'Sign Up'
    expect(current_path).to eq(signup_path)

    fill_in 'Name', with: new_user.name
    fill_in 'user_password', with: new_user.password
    fill_in 'Password confirmation', with: new_user.password_confirmation
    expect{click_button 'Create'}.to change{User.count}.by(1)

    record = User.find_by_name(new_user.name)
    expect(current_path).to eq(user_path(record))

    expect(page).to have_content('successfully')
  end

  let(:user) {create(:user)}
  it "can login" do
    visit root_path
    click_link 'Log In'
    expect(current_path).to eq(login_path)

    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(current_path).to eq(root_path)
    expect(page).to have_content 'successfully'

    expect(page).not_to have_link('Log In')

    click_link 'Log Out'
    expect(current_path).to eq(root_path)
    expect(page).to have_content 'successfully'

    expect(page).not_to have_link('Log Out')
    expect(page).to have_link('Log In')
  end
end
