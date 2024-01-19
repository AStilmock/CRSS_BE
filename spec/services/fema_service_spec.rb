require 'rails_helper'

RSpec.describe 'FEMA API Service Request Response Path' do
  describe 'disaster declarations endpoint' do
    it 'has a successful response' do
      data = FemaService.new.test_endpoint
      data_hash = data

      expect(data_hash).to be_a Hash
      expect(data_hash).to have_key :metadata
      expect(data_hash[:metadata]).to be_a Hash
      expect(data_hash).to have_key :DisasterDeclarationsSummaries
      expect(data_hash[:DisasterDeclarationsSummaries]).to be_a Array
    end
  end
end