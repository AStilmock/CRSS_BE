class CollegeCardService
  def conn
    Faraday.new(url: "https://api.data.gov/ed/collegescorecard/v1/") do |f|
      f.params["api_key"] = ENV["collegeskeycard"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def school_data_search(zip)
    get_url("schools.json?school.degrees_awarded.predominant&_fields=id,school.name,2023.student.size&zip=#{zip}&distance=30mi")
  end
end