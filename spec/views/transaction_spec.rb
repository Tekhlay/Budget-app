require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user = User.create(name: 'Tekhaly', email: 'tek@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @user.save

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'should display the transaction page' do
    visit new_expense_path
    expect(page).to have_content('New transaction')
  end

  it 'should create a new transaction' do
    visit new_expense_path
    fill_in 'Name', with: 'Food'
    fill_in 'Amount', with: 100
    click_button 'Save'
    expect(page).to have_content('Expense was successfully created.')
  end
end
