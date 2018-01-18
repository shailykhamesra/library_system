class Member < ApplicationRecord
  enum gender: [:male, :female]
  belongs_to :library
  has_many :issue_historys
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
