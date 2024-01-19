class FemaService
  def conn
    Faraday.new(url: "https://www.fema.gov/api/open/") do |f|
      
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def test_endpoint
    get_url("v2/DisasterDeclarationsSummaries")
  end
end