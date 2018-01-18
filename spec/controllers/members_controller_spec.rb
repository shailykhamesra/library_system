require 'rails_helper'
RSpec.describe MembersController, type: :controller do
  context 'GET index' do
    it 'should show all member successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show member with given id successfully' do
      member = FactoryGirl.create(:member)
      get :show, params: { id: member.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid member' do
      member = FactoryGirl.create(:member)
      member.destroy
      get :show, params: { id: member.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new member successfully' do
      member = FactoryGirl.create(:member)
      get :new, params:{screen:{name:"qqq", address: "qwer", phone:"1234567890", member_id: member.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct members successfully' do
      member = FactoryGirl.create(:member)
      get :edit, params: { id: member.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct members successfully' do
      member = FactoryGirl.create(:member)
      member.destroy
      get :edit, params: { id: member.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid member creation' do
      library = FactoryGirl.create(:library)
      post :create, params: { member: { name:"qqq" , address: "qwer", phone:"1234567890" , library_id: library.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid member creation' do
      library1 = FactoryGirl.create(:library)
      library1.destroy
      post :create, params:{ member: { name:"qqq", address: "qwer", phone:"1234567890" , library_id: library1.id }}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid member updation' do
      member = FactoryGirl.create(:member)
      put :update, params: { id: member.id, member: { name: member.name, phone: member.phone, address:member.address } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid member updation' do
      member = FactoryGirl.create(:member)
      member.destroy
      put :update, params: {id: member.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid member updation' do
      library1 = FactoryGirl.create(:library)
      library1.destroy
      member = FactoryGirl.create(:member)
      put :update, params: { id: library1.id,member:{name: member.name, phone: member.phone, address:member.address , library_id: library1.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid member deletion' do
      member = FactoryGirl.create(:member)
      delete :destroy, params: { id: member.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      member1 = FactoryGirl.create(:member)
      member1.destroy
      delete :destroy, params: { id: member1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
