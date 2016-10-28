require 'rails_helper'

RSpec.describe Invoice, type: :model do

  fixtures :invoices, :clients, :companies

  before do
    @invoice = invoices(:invoice1)
  end

  context 'attributes' do

    it 'should be valid' do
      expect(@invoice).to be_valid
    end

    it 'should require a client' do
      @invoice.client = nil
      expect(@invoice).to_not be_valid
    end

    it 'should require a body' do
      @invoice.body = nil
      expect(@invoice).to_not be_valid
      @invoice.body = ''
      expect(@invoice).to_not be_valid
    end

  end

end
