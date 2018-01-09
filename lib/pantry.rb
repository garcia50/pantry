class Pantry
  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
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
      print "* #{key}: #{value}\n"
    end 
  end

end
