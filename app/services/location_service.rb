class LocationService
  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.params["key"] = ENV["googskey"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def location_search(zip)
    get_url("/maps/api/geocode/json?address=#{zip}")
  end
end