module GooglePlaces
  def self.search(search_term)
    api_key = ENV["GOOGLE_PLACES_API_KEY"]
    results = HTTParty.get(URI.escape("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{search_term}&types=locality|political&key=#{api_key}"))['results']

    places = []
    results.each do |place|
      place_hash = {}

      # place has a string with formatted address
      # where the first comma seperated item is the city and the
      # second is the country
      place_info = place['formatted_address'].split(', ')
      place_hash[:city] = place_info[0]

      # the second item can sometimes have a zip code when dealing
      # with US locations. For US locations in the Place model, the
      # city is a city name and the country is the state name.
      place_hash[:country] = place_info[1].split(' ')[0]

      places << place_hash

      # the places generated are kept in the application for future
      # usage so that it won't always have to rely on api calls to google
      # and can make quicker calls to the server instead
      if Place.where("city='#{place_hash[:city]}' AND country='#{place_hash[:country]}'").count == 0
        Place.create(place_hash)
      end
    end

    places
  end
end
