require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class Parser
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def parse
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{@ingredient}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    recipes = []

    doc.search(".node-teaser-item").first(5).each do |item|
      name = item.search(".teaser-item__title").text.strip
      description = item.search(".field-item").text.strip
      recipes << Recipe.new({name: name, description: description})
    end
    return recipes
  end
end
