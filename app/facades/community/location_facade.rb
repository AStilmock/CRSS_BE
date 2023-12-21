class LocationFacade
  def initialize(input)
    @input = input
  end

  def process_location_search
    service = LocationService.new
    request = service.location_search(@input)
    data = request[:results].first[:address_components]
    communities = data.map do |c|
      Community.new(c)
    end
    communities
  end
end