class Library < ActiveRecord::Base
  has_many :books
  has_many :members
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
