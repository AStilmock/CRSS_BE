class LocationFacade 
  # require 'pry'; binding.pry
  service = LocationService.new
  request = service.location_search(zip)
  data = request[:results].first[:address_components]
  communities = data.map do |c|
    Community.new(c)
  end
end