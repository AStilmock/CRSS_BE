require 'rails_helper'

RSpec.describe 'Location Request API' do
  describe 'mutation request' do
    it 'get successful response' do
      input = <<-GQL
        mutation($input: FindCommunityInput!) {
          findCommunity(input: $input) {
            results {
              formatted_address
            }
          }
        }
      GQL
    
      result = CommunityRssSchema.execute(input, variables: { input: { zipCode: 12345 } })
      result_hash = result.to_h
      require 'pry'; binding.pry
      expect(result.to_h).to be_a Hash
    end
    

    xit 'returns data for zip code in query' do
      query = <<-GQL
        mutation {
          zip_code(
            zip_code: "80226"
          )
        }
      GQL

      result = CommunityRssSchema.execute(query)
    end

    xit "returns error when query fails" do
      query = <<-GQL
        mutation {
          zip_code(
            zip_code: "x"
          )
        }
      GQL
      result = CommunityRssSchema.execute(query)
      expect(result[:data]).to eq nil
    end

    # def zip_query
    #   <<-GQL
    #     mutation {
    #       zip_code(
    #         zip_code: "80226"
    #       )
    #     }
    #   GQL
    # end
  end
end