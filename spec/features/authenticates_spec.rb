require 'rails_helper'

feature "Authenticates", :type => :feature do
  # let(:user) {build(:user)}
  # it 'can signup' do
  #   visit root_path
  #   click_link 'Sign Up'
  #   expect(current_path).to eq(signup_path)
  #
  #   fill_in 'Name', with: user.name
  #   fill_in 'Password', match: :first, with: user.password
  #   fill_in 'Password confirmation', with: user.password
  #   expect{click_on 'Sign Up'}.to change{User.count}.by(1)
  #
  #   expect(current_path).to eq(user_path(user))
  #   expect(page).to have_content('successfully')
  # end

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
