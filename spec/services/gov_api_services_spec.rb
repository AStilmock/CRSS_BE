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

      expect(data).to be_a Hash
      expect(data).to have_key :metadata
      expect(data).to have_key :results
      expect(data[:metadata]).to be_a Hash
      expect(data[:results]).to be_a Array 
    end
  end

  describe "Census API for Community Resilience" do
    it 'gets successful response' do
      data = CommunityResilienceService.new.resilience_data_search
      resilience_hash = data[:dataset].first

      expect(resilience_hash).to be_a Hash
      expect(resilience_hash).to have_key :description
      expect(resilience_hash[:description]).to eq "The Community Resilience Estimates track how at-risk every neighborhood in the United States is to the impacts of a disaster. The Community Resilience Estimates use American Community Survey microdata and Population Estimates Program data to measure the capacity of individuals and households to absorb the external stresses of the impacts of a disaster."
    end
  end
end