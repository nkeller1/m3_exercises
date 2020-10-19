require 'json'
require 'faraday'

class AdviceService

  def random
    response = self.connection.get('/advice')
    JSON.parse(response.body)
  end

  def search(query)
    response = self.connection.get("/advice/search/#{query}")
    JSON.parse(response.body)
  end

  def connection
    conn = Faraday.new(
      url: 'https://api.adviceslip.com/'
      )
  end
end
