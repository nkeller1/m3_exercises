class MarvelService

  


  def connection
    Faraday.new (
      url: 'http(s)://gateway.marvel.com/'
    )
  end
end
