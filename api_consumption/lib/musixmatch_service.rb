require 'json'
require 'faraday'

class MusixMatchService


  def connection
    Faraday.new(
      url: "https://api.musixmatch.com/ws/1.1/"
    )
  end

end
