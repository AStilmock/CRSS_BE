class AirQualityService
  def conn
    Faraday.new(url: "https://aqs.epa.gov/data/api/") do |f|
      # f.params["email"] = ENV["andymailski"]
      # f.params["key"] = ENV["airqualiski"]
      # f.headers["Content-Type"] = "application/json"
    end
  end

  def get_url(url)
    response = conn.get(url)
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def state_code_endpoint
    get_url("list/states?email=andrew.stilmock@gmail.com&key=tealmouse13")
  end
end