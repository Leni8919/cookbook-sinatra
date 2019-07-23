require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @filepath = csv_file_path
    # csv_load
    CSV.foreach(@filepath) do |recipe|
      @recipes << Recipe.new(recipe[0], recipe[1], recipe[2] == "true", recipe[3], recipe[4])
    end
  end

  # def csv_load
  #   CSV.foreach(@file_path) do |recipe|
  #     @recipes << Recipe.new(recipe[0], recipe[1])
  #   end
  # end

  def add_recipe(recipe)
    @recipes << recipe
    csv_save
  end

  def csv_save
    CSV.open(@filepath, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done, recipe.duration, recipe.level]
      end
    end
  end

  def mark_as_done(recipe_index)
    @recipes[recipe_index].mark_done
    csv_save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_save
  end

  def all
    @recipes
  end
end
