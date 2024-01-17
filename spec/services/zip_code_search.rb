require 'rails_helper'

RSpec.describe 'Zip Code Search Service Request Response Path' do
  describe 'Request response path for zip code search service' do
    it 'gets response from API with zip code search' do
      zip_code = "80226"
      data = LocationService.new.location_search(zip_code)
      expect(data).to be_a Hash
      expect(data[:status]).to eq "OK"
    end

    it 'gets response data from consuming the API' do
      zip_code = "80226"
      data = LocationService.new.location_search(zip_code)
      community = data[:results].first
      expect(community).to have_key(:formatted_address)
      expect(community[:formatted_address]).to be_a String
      expect(community[:formatted_address]).to eq "Lakewood, CO 80226, USA"
    end
  end
end