require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

  fixtures :users, :companies

  before do
    @user = users(:user1)
  end

  context 'class methods' do

    it 'log_in should log a user in' do
      log_in @user
      expect(session[:user_id]).to equal(@user.id)
    end

    it 'logged_in? should return whether or not a user is logged in' do
      expect(logged_in?).to be_falsey
      log_in @user
      expect(logged_in?).to be_truthy
    end

    it 'log_out should log a user out' do
      log_in @user
      expect(logged_in?).to be_truthy
      log_out
      expect(logged_in?).to be_falsey
    end

  end

end
