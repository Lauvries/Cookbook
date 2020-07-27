require_relative 'cookbook'
require_relative 'view'
require_relative 'parser'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display
  end

  def mark_as_completed
    display
    index = @view.ask_user_for("Which recipe have you cooked yet? ").to_i
    @cookbook.mark_as_completed(index)
  end

  def create
    name = @view.ask_user_for("Name: ")
    description = @view.ask_user_for("Description: ")
    @cookbook.add_recipe(Recipe.new({name: name, description: description}))
    display
  end

  def import_recipe
    ingredient = @view.ask_user_for("What ingredient would you like to search for: ")
    new_recipes = Parser.new(ingredient).parse
    @view.list_all(new_recipes)
    index = @view.ask_user_for("Which recipe would you like to add? ").to_i
    @cookbook.add_recipe(new_recipes[index - 1])
  end

  def destroy
    display
    index = @view.ask_user_for("Which recipe would you like to destroy?").to_i
    @cookbook.remove_recipe(index)
    display
  end

  private

  def display
    @view.list_all(@cookbook.all)
  end
end
