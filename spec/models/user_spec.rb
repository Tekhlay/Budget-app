require 'rails_helper'

RSpec.describe User, type: :model do
    before :each do
        @user = User.create(name: 'Tekhaly', email: 'tek@gmail.com', 
        password: '123456', password_confirmation: '123456')
    end

    it 'should have valid name' do
        @user.name = nil
        expect(@user).to_not be_valid
    end

    it 'should have valid email' do
        @user.email = nil
        expect(@user).to_not be_valid
    end

    it 'should have valid password' do
        expect(@user.password).to be == '123456'
    end

    it 'should have valid password confirmation' do
        expect(@user.password_confirmation).to be == (@user.password)
    end
end
