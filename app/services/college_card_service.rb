class CollegeCardService
  def conn
    Faraday.new(url: "https://api.data.gov/ed/collegescorecard/v1/schools.json?") do |f|
      f.params["API_KEY"] = ENV["collegskeycard"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def school_data_search(zip)
    get_url("school.zip=#{zip}&distance=30mi")
  end
end