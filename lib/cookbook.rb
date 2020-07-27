require 'csv'
require_relative 'recipe'
# require_relative 'controller'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def mark_as_completed(index)
    @recipes[index - 1].complete
    save_csv
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index - 1)
    save_csv
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["name", "description", "completed"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.completed?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:completed] = row[:completed] == "true"
      @recipes << Recipe.new(row)
    end
  end
end
