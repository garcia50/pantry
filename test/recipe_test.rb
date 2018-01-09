require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test
  attr_reader :r,
              :pantry

  def setup
    @r = Recipe.new("Cheese Pizza")
    @pantry = Pantry.new
  end

  def test_it_has_a_name
    assert_equal "Cheese Pizza", r.name
  end

  def test_ingrediants_begins_with_empty_hash
    assert_equal ({}), r.ingredients
  end

  def test_it_can_add_an_ingredient
    r.add_ingredient("Flour", 20) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 20)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end

  def test_it_tracks_amount_of_a_recipe_required
    r.add_ingredient("Flour", 500)
    assert_equal 500, r.amount_required("Flour")
  end
  
  def test_shopping_list_returns_items
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    pantry.add_to_shopping_list(r)
    
    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end

  def test_we_can_add_another_recipe
    recipe = Recipe.new("Spaghetti")
    
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    recipe.add_ingredient("Spaghetti Noodles", 10)
    recipe.add_ingredient("Marinara Sauce", 10)
    recipe.add_ingredient("Cheese", 5)
    
    pantry.add_to_shopping_list(r)
    pantry.add_to_shopping_list(recipe)

    expect = ({"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10})

    assert_equal expect, pantry.shopping_list
  end

  def test_print_shopping_list
    recipe = Recipe.new("Spaghetti")

    recipe.add_ingredient("Cheese", 25)
    recipe.add_ingredient("Flour", 20)
    recipe.add_ingredient("Spaghetti Noodles", 10)
    recipe.add_ingredient("Marinara Sauce", 10)

    pantry.add_to_shopping_list(recipe)

    assert_equal "* Cheese: 20\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10", pantry.print_shopping_list
  end
end
























