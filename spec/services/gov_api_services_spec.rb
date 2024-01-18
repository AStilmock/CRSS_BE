require 'rails_helper'

RSpec.describe "Government Data API Service" do
  describe 'Crime Data API' do
    it 'gets successful response' do
      state = "CO"
      data = CrimeDataService.new.crime_data_search(state)
      expect(data).to be_a Hash
      expect(data).to have_key :title
      expect(data[:title]).to eq "All Arrest by Offense"
      expect(data).to have_key :keys
      expect(data).to have_key :data
    end
  end

  describe "College Scorecard API" do
    it 'gets successful response' do
      zip_code = "80226"
      data = CollegeCardService.new.school_data_search(zip_code)
      # require 'pry'; binding.pry
      expect(data).to be_a Hash
      expect(data).to have_key :metadata
      expect(data).to have_key :results
      expect(data[:metadata]).to be_a Hash
      expect(data[:results]).to be_a Array 
    end
  end
end