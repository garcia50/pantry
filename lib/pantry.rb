class Pantry
  attr_reader :stock, 
              :shopping_list, 
              :add_to_cookbook

  def initialize
    @stock = {}
    @shopping_list = {}
    @add_to_cookbook = {}
  end

  def stock_check(food)
    if !stock.has_key?(food)
      0
    else
      stock[food]
    end
  end

  def restock(food, num)
    if stock.has_key?(food)
      stock[food] += num
    else
      stock[food] = num
    end
  end

  def add_to_shopping_list(r)
    r.ingredients.each_pair do |key, value|
      if shopping_list.has_key?(key)
        shopping_list[key] += value
      else
        shopping_list[key] = value
      end
    end
  end

  def print_shopping_list
    shopping_list.each do |key, value|
      puts "* #{key}: #{value}\n"
    end 
  end

  def add_to_cookbook(r)
    r.ingredients.each_pair do |key, value|
      if @add_to_cookbook.has_key?(key)
        @add_to_cookbook[key]["Cheese Pizza"] += value["Cheese Pizza"] 
      else
        @add_to_cookbook[key] = value
      end
    end
  end

  def what_can_i_make
    ingr = @add_to_cookbook.each_pair do |key, value|
      require 'pry'; binding.pry
    end
    sorted = ingr.sort_by { |amount| amount.min }
    sorted.first.ingredients.keys[value] - sorted.last.ingredients.keys[value]
  end

end








