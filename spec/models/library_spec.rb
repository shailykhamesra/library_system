require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'validation test' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:library).should be_valid
    end
    it 'is valid with a address' do 
  	  FactoryGirl.build(:library).should be_valid	
    end
    it 'is valid with a address' do 
  	  FactoryGirl.build(:library).should be_valid	
    end
    it 'is of invalid without a name' do 
      FactoryGirl.build(:library, name:nil).should_not be_valid 
    end
    it 'is of invalid without a address' do 
      FactoryGirl.build(:library, address:nil).should_not be_valid 
    end
    it 'is of invalid without a phone' do 
      FactoryGirl.build(:library, phone:nil).should_not be_valid 
    end
  end
  context 'association' do
    it 'should have many book' do
      library = FactoryGirl.create(:library)
      book1 = FactoryGirl.create(:book, library_id: library.id)
      book2 = FactoryGirl.create(:book, library_id:library.id)
      book3 = FactoryGirl.create(:book, library_id:library.id)
      book1.library.id.should eq library.id and book2.library.id.should eq library.id and book3.library.id.should eq library.id
    end
    it 'should have many members' do
      library = FactoryGirl.create(:library)
      member1 = FactoryGirl.create(:member, library_id: library.id)
      member2 = FactoryGirl.create(:member, library_id:library.id)
      member3 = FactoryGirl.create(:member, library_id:library.id)
      member1.library.id.should eq library.id and member2.library.id.should eq library.id and member3.library.id.should eq library.id
    end
    it 'should not have many book' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      book1 = FactoryGirl.create(:book, library_id: library1.id)
      book2 = FactoryGirl.create(:book, library_id:library2.id)
      book1.library.id.should_not eq library2.id 
      book2.library.id.should_not eq library1.id 
   end
    it 'should not have many members' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      member1 = FactoryGirl.create(:member, library_id: library1.id)
      member2 = FactoryGirl.create(:member, library_id:library2.id)
      member1.library.id.should_not eq library2.id 
      member2.library.id.should_not eq library1.id 
   end
  end
end
 
  