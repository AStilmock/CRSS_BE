class AirQualityService
  def conn
    Faraday.new(url: "https://aqs.epa.gov/data/api/") do |f|
      
    end
  end

  def get_url(url)
    response = conn.get(url)
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def test_endpoint
    get_url("metaData/revisionHistory?email=#{ENV["andymailski"]}&key=#{ENV["airqualiski"]}")
  end
end