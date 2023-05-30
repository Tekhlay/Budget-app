class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
  has_many :groups, through: :expense_groups

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :author, presence: true
end
