require 'rails_helper'
RSpec.describe booksController, type: :controller do
  context 'GET index' do
    it 'should show all book successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show book with given id successfully' do
      book = FactoryGirl.create(:book)
      get :show, params: { id: book.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid books' do
      book = FactoryGirl.create(:book)
      book.destroy
      get :show, params: { id: book.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'edit' do
    it 'should get correct books successfully' do
      book = FactoryGirl.create(:book)
      get :edit, params: { id: book.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not get correct books successfully' do
      book = FactoryGirl.create(:book)
      book.destroy
      get :edit, params: { id: book.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new book successfully' do
      library = FactoryGirl.create(:library)
      category = FactoryGirl.create(:category)
      issue_history = FactoryGirl.create(:issue_history)
      get :new, params:{book:{name: 'avbs', library_id: library.id, category_id: category.id,issue_history_id: issue_history.id }}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do
    it 'should be a valid book creation' do
      library = FactoryGirl.create(:library)
      category = FactoryGirl.create(:category)
      issue_history = FactoryGirl.create(:issue_history)
      post :create, params:{ book: { name: 'avbs', library_id: library.id, category_id: category.id,issue_history_id: issue_history.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid book creation' do
      library1 = FactoryGirl.create(:library)
      library1.destroy
      category = FactoryGirl.create(:category)
      issue_history = FactoryGirl.create(:issue_history)
      post :create, params:{ book: { name: "avbs", library_id: library1.id, category_id: category.id, issue_history_id: issue_history.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid book creation' do
      library = FactoryGirl.create(:library)
      category1 = FactoryGirl.create(:category)
      category1.destroy
      issue_history = FactoryGirl.create(:issue_history)
      post :create, params:{ book: { name: "avbs", library_id: library.id, category_id: category1.id,issue_history_id: issue_history.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid book creation' do
      library = FactoryGirl.create(:library)
      library.destroy
      category = FactoryGirl.create(:category)
      category.destroy
      issue_history = FactoryGirl.create(:issue_history)
      issue_history.destroy
      post :create, params:{book: { name:"avbs", library_id: library.id, category_id: category.id,issue_history_id: issue_history.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid book updation' do
      book = FactoryGirl.create(:book)
      put :update, params: { id: book.id,book:{name: book.name} }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid book updation' do
      book = FactoryGirl.create(:book)
      book.destroy
      put :update, params: {id: book.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid book updation' do
      book = FactoryGirl.create(:book)
      library1 = FactoryGirl.create(:library)
      library1.destroy
      category = FactoryGirl.create(:category)
      put :update, params: { id: book.id,book:{name: book.name, library_id: library1.id, category_id: category.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid book deletion' do
      book = FactoryGirl.create(:book)
      delete :destroy, params: { id: book.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid book deletion' do
      book1 = FactoryGirl.create(:book)
      book1.destroy
      delete :destroy, params: { id: book1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid book deletion' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end 
end
