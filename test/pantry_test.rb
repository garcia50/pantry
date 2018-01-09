require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  attr_reader :pantry

  def setup
    @pantry = Pantry.new  
  end

  def test_it_exist
    assert_instance_of Pantry, pantry
  end

  def test_pantry_begins_with_empty_hash
    assert_equal ({}), pantry.stock
  end

  def test_if_stock_has_any_food
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_if_restock_adds_food
    pantry.restock("Cheese", 10)
    
    assert_equal 10, pantry.stock_check("Cheese")
  end

end
