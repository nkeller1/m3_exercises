require 'json'
require 'faraday'

class MusixMatchService

  def music_genres
    response = self.connection.get("music.genres.get?apikey=#{ENV["MUSIXMATCH_API_KEY"]}")
    JSON.parse(response.body)
  end

  # def tracks_from_artist(artist)
  #   response = self.connection.get("music.genres.get?apikey=#{ENV["MUSIXMATCH_API_KEY"]}")
  #   JSON.parse(response.body)
  # end

  def connection
    Faraday.new(
      url: "https://api.musixmatch.com/ws/1.1/"
    )
  end

end
