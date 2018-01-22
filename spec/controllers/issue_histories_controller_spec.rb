require 'rails_helper'
RSpec.describe IssueHistoriesController, type: :controller do
  context 'GET index' do
    it 'should show all issue_history successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show issue_history with given id successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      get :show, params: { id: issue_history.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid issue_history' do
      issue_history = FactoryGirl.create(:issue_history)
      issue_history.destroy
      get :show, params: { id: issue_history.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new issue_history successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      get :new, params:{screen:{name:"qqq", issue_history_id: issue_history.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct issue_historys successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      get :edit, params: { id: issue_history.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct issue_historys successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      issue_history.destroy
      get :edit, params: { id: issue_history.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid issue_history creation' do
      member1 = FactoryGirl.create(:member)
      post :create, params: { issue_history: { name:"qwe"  , member_id: member1.id } }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid issue_history creation' do
      member1 = FactoryGirl.create(:member)
      member1.destroy
      post :create, params:{ issue_history: { name:"qqq" , member_id: member1.id }}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid issue_history updation' do
      issue_history = FactoryGirl.create(:issue_history)
      put :update, params: { id: issue_history.id, issue_history: { name: 'a'} }, format: 'json'
      issue_history1=IssueHistory.last
      issue_history1.name.should eq 'a'
      response.should have_http_status(:ok)
    end
    it 'should not be valid issue_history updation' do
      issue_history = FactoryGirl.create(:issue_history)
      issue_history.destroy
      put :update, params: {id: issue_history.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid issue_history updation' do
      member1 = FactoryGirl.create(:member)
      member1.destroy
      issue_history = FactoryGirl.create(:issue_history)
      put :update, params: { id: member1.id,issue_history:{name: issue_history.name , member_id: member1.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid issue_history deletion' do
      issue_history = FactoryGirl.create(:issue_history)
      delete :destroy, params: { id: issue_history.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      issue_history1 = FactoryGirl.create(:issue_history)
      issue_history1.destroy
      delete :destroy, params: { id: issue_history1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
