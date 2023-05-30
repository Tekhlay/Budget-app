require 'rails_helper'

RSpec.describe Group, type: :model do
    before :each do
        @user = User.create(name: 'Tekhaly', email: 'tek@gmail.com', 
        password: '123456', password_confirmation: '123456')
        @group = Group.create(name: 'Food', author: @user)
    end
    
    it 'should have valid name' do
        @group.name = nil
        expect(@group).to_not be_valid
    end

    it 'should have valid author' do
        @group.author = nil
        expect(@group).to_not be_valid
    end

    it 'should have valid icon' do
        @group.icon = nil
        expect(@group).to_not be_valid
    end
end
