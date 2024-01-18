require 'rails_helper'

RSpec.describe 'Location Request API' do
  describe 'mutation request' do
    it 'gets successfull response' do
      zip_code = "80226"
      mutation = <<~GQL
        mutation{community(zipCode: "#{zip_code}") {
          name
          county
          state
          zipCode
          }
        }
      GQL

      post '/graphql', params: { query: mutation }
      expect(status).to eq 200
      expect(response).to be_successful
    end
    
    it 'gets data back in successful response' do
      zip_code = "80226"
      mutation = <<~GQL
        mutation{community(zipCode: "#{zip_code}") {
          name
          county
          state
          zipCode
        }
      }
      GQL
    
      post '/graphql', params: { query: mutation }
      object = JSON.parse(response.body, symbolize_names: true)
      community = object[:data][:community]
      expect(community).to be_a Hash
      expect(community).to have_key(:name)
      expect(community).to have_key(:county)
      expect(community).to have_key(:state)
      expect(community).to have_key(:zipCode)
    end

    it 'gets values from the keys in the response' do
      zip_code = "80226"
      mutation = <<~GQL
        mutation{community(zipCode: "#{zip_code}") {
          name
          county
          state
          zipCode
        }
      }
      GQL
    
      post '/graphql', params: { query: mutation }
      object = JSON.parse(response.body, symbolize_names: true)
      community = object[:data][:community]
      expect(community[:name]).to eq "Lakewood"
      expect(community[:county]).to eq "Jefferson County"
      expect(community[:state]).to eq "CO"
      expect(community[:zipCode]).to eq zip_code
    end
  end
end