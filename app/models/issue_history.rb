class IssueHistory < ActiveRecord::Base
  belongs_to :book
  belongs_to :member
  validates :name, presence: true
end
