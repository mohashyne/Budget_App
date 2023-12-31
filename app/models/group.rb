class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups

  validates :name, presence: true
  validates :icon, presence: true
end
