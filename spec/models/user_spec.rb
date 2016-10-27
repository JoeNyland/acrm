require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :users, :companies

  before do
    @user = users(:user1)
  end

  context 'attributes' do

    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should require a name' do
      @user.name = ''
      expect(@user).not_to be_valid
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'name should not allow names that are too long' do
      @user.name = 'a'*300
      expect(@user).not_to be_valid
    end

    it 'name should not be too short' do
      @user.name = 'a'*2
      expect(@user).not_to be_valid
    end

    it 'email validation should accept valid addresses' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end

    it 'email validation should reject invalid addresses' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end

    it 'email addresses should be unique' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).not_to be_valid
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'should require a company' do
      company = @user.company
      @user.company = nil
      expect(@user).not_to be_valid
      @user.company = company
      expect(@user).to be_valid
    end

  end

end
