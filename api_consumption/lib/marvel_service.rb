require 'json'
require 'faraday'
require 'digest/md5'

class MarvelService

  def character(name)
    response = connection.get("v1/public/characters?name=#{name}#{self.api_auth}")
    JSON.parse(response.body)
  end


  def connection
    Faraday.new(
      url: 'https://gateway.marvel.com/'
    )
  end

  def api_auth
    "&ts=#{self.ts}&apikey=#{ENV["MARVEL_PUBLIC"]}&hash=#{self.hash_digest}"
  end

  def hash_digest
    Digest::MD5.hexdigest("#{self.ts}#{ENV['MARVEL_PRIVATE']}#{ENV['MARVEL_PUBLIC']}")
  end

  def ts
    Time.now.to_i
  end
end
