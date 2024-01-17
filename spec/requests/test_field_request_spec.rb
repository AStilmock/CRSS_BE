require 'rails_helper'

RSpec.describe 'Test API Request Response Path' do
  it 'successful test query response' do
    post "/graphql", params: { query: %{{
      testField
    }}}
    data = JSON.parse(response.body)["data"]
    expect(response.status).to eq(200)
    expect(data).to be_a Hash
  end

  it 'successful test query response' do
    post "/graphql", params: { query: %{{
      testField
    }}}
    data = JSON.parse(response.body)["data"]
    expect(data).to have_key("testField")
    expect(data["testField"]).to be_a String
    expect(data["testField"]).to eq("Hello World!")
  end
end