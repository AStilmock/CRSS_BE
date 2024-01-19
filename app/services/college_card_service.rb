class CollegeCardService
  def conn
    Faraday.new(url: "https://api.data.gov/ed/collegescorecard/v1/") do |f|
      f.params["api_key"] = ENV["collegeskicard"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def school_data_search(zip)
    get_url("schools.json?zip=#{zip}&distance=30_fields=id,school.name")
  end
end