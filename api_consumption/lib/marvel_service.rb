class MarvelService

  def character

  end


  def connection
    Faraday.new (
      url: 'http(s)://gateway.marvel.com/'
    )
  end
end
