require 'rails_helper'
RSpec.describe LibrariesController, type: :controller do
  context 'GET index' do
    it 'should show all library successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show library with given id successfully' do
      library = FactoryGirl.create(:library)
      get :show, params: { id: library.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid library ' do
      library = FactoryGirl.create(:library)
      library.destroy
      get :show, params: { id: library.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'GET new' do
    it 'should get new library successfully' do
      library = FactoryGirl.create(:library)
      get :new, params:{library:{name:library.name, address:library.address, phone:library.phone}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET edit' do
    it 'should get correct librarys successfully' do
      library = FactoryGirl.create(:library)
      get :edit, params: { id: library.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct library successfully' do
      library = FactoryGirl.create(:library)
      library.destroy
      get :edit, params: { id: library.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid library creation' do
      post :create, params: { library: { name: "ascd", address:"qwe", phone:"1234567890" } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a library with valid name' do
      post :create, params: { library: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid library updation' do
      library = FactoryGirl.create(:library)
      put :update, params: { id: library.id, library: { name: 'a', address: 'a', phone: '1234567890'} }, format: 'json'
      library1=Library.last
      library1.name.should eq 'a'
      response.should have_http_status(:ok)
    end
    it 'should not be valid library updation' do
      library = FactoryGirl.create(:library)
      library.destroy
      put :update, params: {id: library.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid library updation' do
      library = FactoryGirl.create(:library)
      library.destroy
      put :update, params: { id: library.id,library:{name: ""} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid library deletion' do
      library = FactoryGirl.create(:library)
      delete :destroy, params: { id: library.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: ""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
