class AirQualityService
  def conn
    Faraday.new(url: "https://aqs.epa.gov/data/api/") do |f|
      f.params["email"] = ENV["ANDYEMAIL"]
      f.params["key"] = ENV["airqualiski"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def test_endpoint
    get_url("metaData/revisionHistory")
  end
end