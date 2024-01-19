class CrimeDataService
  def conn
    Faraday.new(url: "https://api.usa.gov/crime/fbi/cde/") do |f|
      f.params["API_KEY"] = ENV["crimeski"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def crime_data_search(state)
    get_url("arrest/state/#{state}/all?from=1980&to=2024")
  end
end
