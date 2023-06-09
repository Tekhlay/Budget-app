class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :icon, presence: true, length: { minimum: 3, maximum: 250 }
  has_one_attached :icon
end
