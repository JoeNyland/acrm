require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  fixtures :users

  before do
    @user = users :user1
  end

  describe 'GET #index' do
    it 'redirects to login if not logged in' do
      get :index
      expect(response).to be_redirect
    end
    it 'returns http success if logged in' do
      log_in_as(@user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
