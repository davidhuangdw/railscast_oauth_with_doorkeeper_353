require 'rails_helper'

feature "Tasks", :type => :feature do
  context 'when log in' do
    let(:user) {create(:user)}
    before do
      visit root_path
      click_link 'Log In'
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
      click_button 'Log In'
    end

    it "should create his own tasks" do
      visit tasks_path
      click_on 'New Task'
      fill_in 'Name', with: 'a task'
      expect{click_on 'Create'}.to change{user.tasks.count}.by(1)
      expect(page).to have_content 'successfully'
    end
  end
end
