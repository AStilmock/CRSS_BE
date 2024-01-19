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

  # def state_code_search
  #   get_url("")
  # end

  def air_quality_data(state_code, county_code)
    get_url("annualData/byCounty?param=88101,88502&bdate=19800101&edate=20231231&state=#{state_code}&county=#{county_code}")
  end
end