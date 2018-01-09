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

end
























