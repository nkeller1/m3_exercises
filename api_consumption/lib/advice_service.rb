require 'json'
require 'faraday'

class AdviceService

  def random
    response = Faraday.get 'https://api.adviceslip.com/advice'
    JSON.parse(response.body)
  end

  

end
