require 'rails_helper'

RSpec.describe Client, type: :model do

  fixtures :clients, :companies

  before do
    @client = clients(:client1)
  end

  context 'attributes' do

    it 'should be valid' do
      expect(@client).to be_valid
    end

    it 'should require a name' do
      @client.name = ''
      expect(@client).not_to be_valid
      @client.name = nil
      expect(@client).not_to be_valid
    end

    it 'name should not allow names that are too long' do
      @client.name = 'a'*300
      expect(@client).not_to be_valid
    end

    it 'name should not be too short' do
      @client.name = 'a'*2
      expect(@client).not_to be_valid
    end

    it 'email validation should accept valid addresses' do
      valid_addresses = %w[client@example.com CLIENT@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @client.email = valid_address
        expect(@client).to be_valid
      end
    end

    it 'email validation should reject invalid addresses' do
      invalid_addresses = %w[client@example,com client_at_foo.org client.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @client.email = invalid_address
        expect(@client).not_to be_valid
      end
    end

    it 'email addresses should be unique' do
      duplicate_client = @client.dup
      @client.save
      expect(duplicate_client).not_to be_valid
      duplicate_client.email = @client.email.upcase
      @client.save
      expect(duplicate_client).not_to be_valid
    end

    it 'should require a company' do
      company = @client.company
      @client.company = nil
      expect(@client).not_to be_valid
      @client.company = company
      expect(@client).to be_valid
    end

    it 'should require an address' do
      @client.address = nil
      expect(@client).not_to be_valid
    end

  end

end
