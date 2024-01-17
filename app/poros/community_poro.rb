class CommunityPoro
  attr_reader :city, :county, :state, :zip_code
  def initialize(data)
    @city = data[:name]
    @county = data[:county]
    @state = data[:state]
    @zip_code = data[:zip_code]
  end
end