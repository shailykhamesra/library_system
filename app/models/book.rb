class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
  has_many :issue_historys
  validates :name, presence: true
end
