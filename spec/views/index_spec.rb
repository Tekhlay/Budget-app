require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit index_index_path
  end

  it 'should have valid title' do
    expect(page).to have_content('Budget App')
  end

  it 'should have valid link to sign up' do
    expect(page).to have_link('SIGN UP')
  end

  it 'should have valid link to sign in' do
    expect(page).to have_link('LOG IN')
  end

  it 'should display sign up page' do
    click_link('SIGN UP')
    expect(page).to have_content('REGISTER')
  end

  it 'should display log in page' do
    click_link('LOG IN')
    expect(page).to have_content('Forget password?')
  end
end
