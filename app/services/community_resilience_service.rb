class CommunityResilienceService
  def conn
    Faraday.new(url: "https://api.census.gov/data/") do |f|
      f.headers["key"] = ENV["censuskey"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def resilience_data_search
    get_url("2021/cre")
  end
end