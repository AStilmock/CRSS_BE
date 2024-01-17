class LocationFacade
  def initialize(input)
    @input = input
  end

  def process_location_search
    service = LocationService.new
    request = service.location_search(@input)
    data = request[:results].first[:address_components]
    zip_code = data.first[:short_name]
    name = data.second[:short_name]
    county = data.third[:short_name]
    state = data.fourth[:short_name]
    community_data = {
      zip_code: zip_code,
      name: name,
      county: county,
      state: state
    }
    community = CommunityPoro.new(community_data)
    community
  end
end