require 'rails_helper'

RSpec.describe Estimate, type: :model do

  fixtures :estimates, :clients, :companies

  before do
    @estimate = estimates(:estimate1)
  end

  context 'attributes' do

    it 'should be valid' do
      expect(@estimate).to be_valid
    end

    it 'should require a client' do
      @estimate.client = nil
      expect(@estimate).to_not be_valid
    end

    it 'should require a body' do
      @estimate.body = nil
      expect(@estimate).to_not be_valid
      @estimate.body = ''
      expect(@estimate).to_not be_valid
    end

  end

end
