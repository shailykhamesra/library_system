require 'rails_helper'

RSpec.describe IssueHistory, type: :model do
  context 'validation test' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:issue_history).should be_valid
    end
    it 'is invaild without a name' do
      FactoryGirl.build(:issue_history, name: nil).should_not be_valid
    end
  end
   context 'association' do
    it 'should belongs to book' do
      book= FactoryGirl.create(:book)
      issue_history = FactoryGirl.create(:issue_history ,book_id: book.id)
      issue_history.book_id.should eq book.id
    end
    it 'should not belongs to book' do
      book1= FactoryGirl.create(:book)
      book2= FactoryGirl.create(:book)
      issue_history = FactoryGirl.create(:issue_history ,book_id: book1.id)
      issue_history.book_id.should_not eq book2.id
    end
    it 'should belongs to member' do
      member= FactoryGirl.create(:member)
      issue_history = FactoryGirl.create(:issue_history ,member_id: member.id)
      issue_history.member_id.should eq member.id
    end
    it 'should not belongs to member' do
      member1= FactoryGirl.create(:member)
      member2= FactoryGirl.create(:member)
      issue_history = FactoryGirl.create(:issue_history ,member_id: member1.id)
      issue_history.member_id.should_not eq member2.id
    end
  end
end