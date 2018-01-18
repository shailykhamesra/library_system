require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'validation test' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:member).should be_valid
    end
    it 'is valid with a address' do 
  	  FactoryGirl.build(:member).should be_valid	
    end
    it 'is valid with a address' do 
  	  FactoryGirl.build(:member).should be_valid	
    end
    it 'is of invalid without a name' do 
      FactoryGirl.build(:member, name:nil).should_not be_valid 
    end
    it 'is of invalid without a address' do 
      FactoryGirl.build(:member, address:nil).should_not be_valid 
    end
    it 'is of invalid without a phone' do 
      FactoryGirl.build(:member, phone:nil).should_not be_valid 
    end
  end
  context 'association' do
    it 'should have many issue_history' do
      member = FactoryGirl.create(:member)
      issue_history1 = FactoryGirl.create(:issue_history, member_id: member.id)
      issue_history2 = FactoryGirl.create(:issue_history, member_id:member.id)
      issue_history3 = FactoryGirl.create(:issue_history, member_id:member.id)
      issue_history1.member.id.should eq member.id and issue_history2.member.id.should eq member.id and issue_history3.member.id.should eq member.id
    end
    it 'should not have many issue_history' do
      member1 = FactoryGirl.create(:member)
      member2 = FactoryGirl.create(:member)
      issue_history1 = FactoryGirl.create(:issue_history, member_id: member1.id)
      issue_history2 = FactoryGirl.create(:issue_history, member_id:member2.id)
      issue_history1.member.id.should_not eq member2.id 
      issue_history2.member.id.should_not eq member1.id 
    end
    it 'should belongs to library' do
      library= FactoryGirl.create(:library)
      member = FactoryGirl.create(:member ,library_id: library.id)
      member.library_id.should eq library.id
    end
    it 'should not belongs to library' do
      library1= FactoryGirl.create(:library)
      library2= FactoryGirl.create(:library)
      member = FactoryGirl.create(:member ,library_id: library1.id)
      member.library_id.should_not eq library2.id
    end
  end
end
 
  