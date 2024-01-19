require 'rails_helper'

RSpec.describe 'Air Quality API Service' do
  describe 'air quality api request' do
    it 'gets a successful response' do
      state_code = "08"
      county_code = "059"
      AirQualityService.new.air_quality_data(state_code, county_code)
      data = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    end
  end
end