class CensusDataService
  def conn
    Faraday.new(url: "https://api.census.gov/data/") do |f|
      f.headers["key"] = ENV["censuski"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def resilience_data_search
    get_url("2021/cre")
  end

  def economic_census
    get_url("2017/ecnbasic")
  end

  def population_estimates
    get_url("2021/pep/population")
  end

  def public_sector
    get_url("timeseries/govs")
  end

  def zip_code_business_trends
    get_url("2018/zbp")
  end
end