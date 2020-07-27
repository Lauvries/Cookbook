class Recipe
  attr_reader :name, :description

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @completed = attributes[:completed] || false
    # @preparation_time = preparation_time
    # @ingredients = ingredients
    # @owner = owner
    # @difficulty = difficulty
  end

  def complete
    @completed = true
  end

  def completed?
    @completed
  end
end
