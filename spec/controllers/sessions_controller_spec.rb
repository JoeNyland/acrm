require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'should get new' do
    get :new
    expect(response).to be_success
    expect(response).to render_template(:new)
  end
end
