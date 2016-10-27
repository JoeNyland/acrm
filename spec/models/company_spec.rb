require 'rails_helper'

RSpec.describe Company, type: :model do

  fixtures :companies

  before do
    @company = companies(:company1)
  end

  context 'attributes' do

    it 'should be valid' do
      expect(@company).to be_valid
    end

    it 'should require a name' do
      @company.name = ''
      expect(@company).not_to be_valid
      @company.name = nil
      expect(@company).not_to be_valid
    end

    it 'name should not allow names that are too long' do
      @company.name = 'a'*300
      expect(@company).not_to be_valid
    end

    it 'name should not be too short' do
      @company.name = 'a'*2
      expect(@company).not_to be_valid
    end

    it 'should require a website' do
      @company.website = ''
      expect(@company).not_to be_valid
      @company.website = nil
      expect(@company).not_to be_valid
    end

    it 'should require an address' do
      @company.address = nil
      expect(@company).not_to be_valid
    end

  end

end
