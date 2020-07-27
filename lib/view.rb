require_relative "recipe"

class View
  def list_all(recipes)
    puts ""
    puts "Recipes: "
    recipes.each_with_index do |recipe, index|
      status = recipe.completed? ? "[X]" : "[ ]"
      puts "#{status} #{index + 1}) #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for(stuff)
    puts stuff.to_s
    print "> "
    return gets.chomp
  end
end
