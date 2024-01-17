require 'rails_helper'

RSpec.describe 'Zip Code Facade Creation' do
  describe 'Facade creation with zip code input' do
    it 'returns community object' do
      zip_code = '80226'
      community = LocationFacade.new(zip_code).process_location_search
      expect(community).to be_a CommunityPoro
      expect(community.city).to eq 'Lakewood'
      expect(community.county).to eq 'Jefferson County'
      expect(community.state).to eq 'CO'
      expect(community.zip_code).to eq zip_code
    end
  end
end