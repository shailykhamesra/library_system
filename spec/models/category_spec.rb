require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation test' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:category).should be_valid
    end
    it 'is invaild without a name' do
      FactoryGirl.build(:category, name: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should have many book' do
      category = FactoryGirl.create(:category)
      book1 = FactoryGirl.create(:book, category_id: category.id)
      book2 = FactoryGirl.create(:book, category_id:category.id)
      book3 = FactoryGirl.create(:book, category_id:category.id)
      book1.category.id.should eq category.id and book2.category.id.should eq category.id and book3.category.id.should eq category.id
    end
    it 'should not have many book' do
      category1 = FactoryGirl.create(:category)
      category2 = FactoryGirl.create(:category)
      book1 = FactoryGirl.create(:book, category_id: category1.id)
      book2 = FactoryGirl.create(:book, category_id:category2.id)
      book1.category.id.should_not eq category2.id 
      book2.category.id.should_not eq category1.id 
    end
  end
end