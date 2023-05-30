require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(name: 'Tekhaly', email: 'tek@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Food', author: @user)
    @expense = Expense.create(name: 'Food', amount: 100, author_id: @user)
  end

  it 'should have valid name' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'should have name greater than 3 characters' do
    @expense.name = 'Fo'
    expect(@expense).to_not be_valid
  end

  it 'should have name less than 250 characters' do
    @expense.name = 'a' * 251
    expect(@expense).to_not be_valid
  end

  it 'should have valid author' do
    @expense.author = nil
    expect(@expense).to_not be_valid
  end

  it 'should have valid amount' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'should have amount greater than 0' do
    @expense.amount = 0
    expect(@expense).to_not be_valid
  end
end
