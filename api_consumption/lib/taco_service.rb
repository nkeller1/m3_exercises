require 'json'
require 'faraday'

class TacoService

  def random_ingredients
    response = self.connection.get("random/")
    JSON.parse(response.body)
  end

  def random_taco
    response = self.connection.get("random/?full-taco=true")
    JSON.parse(response.body)
  end

  def ingredients_by_type(ingredient_type)
    response = self.connection.get("/contributors/#{ingredient_type}/")
    JSON.parse(response.body)
  end

  def contributors_by_ingredient(ingredient_type, ingredient)
    response = self.connection.get("/contributors/#{ingredient_type}/#{ingredient}/")
    JSON.parse(response.body)
  end

  def contributions(github_username)
    response = self.connection.get("contributions/#{github_username}/")
    JSON.parse(response.body)
  end

  def connection
    Faraday.new(
      url: "http://taco-randomizer.herokuapp.com/"
    )
  end

end
