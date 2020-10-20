require 'json'
require 'faraday'

 class ChuckService

   def random
     response = self.connection.get('jokes/random')
     JSON.parse(response.body)
   end

   def random_in_category(query)
     response = self.connection.get("jokes/random?category=#{query}")
     JSON.parse(response.body)
   end

   def categories
     response = self.connection.get("jokes/categories")
     JSON.parse(response.body)
   end

   def search(category)
     response = self.connection.get("jokes/search?query=#{category}")
     JSON.parse(response.body)
   end

   def connection
     Faraday.new(
       url: 'https://api.chucknorris.io/'
       )
   end
 end
