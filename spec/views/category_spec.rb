require 'rails_helper'

RSpec.describe "Category page", type: :feature do
    before :each do
        @user = User.create(name: 'Tekhaly', email: 'tek@gmail.com', 
        password: '123456', password_confirmation: '123456')
        @user.save

        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Log in'
    end

    it 'should display catalog page' do
        visit groups_path
        expect(page).to have_content('Categories')
    end

    it 'should display new category page' do
        visit new_group_path
        expect(page).to have_content('New Category')
    end

end