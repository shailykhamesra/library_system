require 'rails_helper'
RSpec.describe categorysController, type: :controller do
  context 'GET index' do
    it 'should show all category successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show category with given id successfully' do
      category = FactoryGirl.create(:category)
      get :show, params: { id: category.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid category ' do
      category = FactoryGirl.create(:category)
      category.destroy
      get :show, params: { id: category.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'GET new' do
    it 'should get new category successfully' do
      category = FactoryGirl.create(:category)
      category.destroy
      get :new, params:{category:{name:category.name}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET edit' do
    it 'should get correct categorys successfully' do
      category = FactoryGirl.create(:category)
      get :edit, params: { id: category.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct category successfully' do
      category = FactoryGirl.create(:category)
      category.destroy
      get :edit, params: { id: category.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid category creation' do
      post :create, params: { category: { name: "ascd" } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a category with valid name' do
      post :create, params: { category: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid category updation' do
      category = FactoryGirl.create(:category)
      put :update, params: { id: category.id, category: { name: category.name } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid category updation' do
      category = FactoryGirl.create(:category)
      category.destroy
      put :update, params: {id: category.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid category updation' do
      category = FactoryGirl.create(:category)
      put :update, params: { id: category.id,category:{name: ""} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid category deletion' do
      category = FactoryGirl.create(:category)
      delete :destroy, params: { id: category.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: ""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
