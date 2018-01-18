require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation test' do
    it 'is valid with a name' do 
  	  FactoryGirl.build(:book).should be_valid
    end
    it 'is invaild without a name' do
      FactoryGirl.build(:book, name: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should have many issue_history' do
      book = FactoryGirl.create(:book)
      issue_history1 = FactoryGirl.create(:issue_history, book_id: book.id)
      issue_history2 = FactoryGirl.create(:issue_history, book_id:book.id)
      issue_history3 = FactoryGirl.create(:issue_history, book_id:book.id)
      issue_history1.book.id.should eq book.id and issue_history2.book.id.should eq book.id and issue_history3.book.id.should eq book.id
    end
    it 'should not have many issue_history' do
      book1 = FactoryGirl.create(:book)
      book2 = FactoryGirl.create(:book)
      issue_history1 = FactoryGirl.create(:issue_history, book_id: book1.id)
      issue_history2 = FactoryGirl.create(:issue_history, book_id:book2.id)
      issue_history1.book.id.should_not eq book2.id 
      issue_history2.book.id.should_not eq book1.id 
    end
    it 'should belongs to category' do
      category= FactoryGirl.create(:category)
      book = FactoryGirl.create(:book ,category_id: category.id)
      book.category_id.should eq category.id
    end
    it 'should not belongs to category' do
      category1= FactoryGirl.create(:category)
      category2= FactoryGirl.create(:category)
      book = FactoryGirl.create(:book ,category_id: category1.id)
      book.category_id.should_not eq category2.id
    end
    it 'should belongs to library' do
      library= FactoryGirl.create(:library)
      book = FactoryGirl.create(:book ,library_id: library.id)
      book.library_id.should eq library.id
    end
    it 'should not belongs to library' do
      library1= FactoryGirl.create(:library)
      library2= FactoryGirl.create(:library)
      book = FactoryGirl.create(:book ,library_id: library1.id)
      book.library_id.should_not eq library2.id
    end
  end
end