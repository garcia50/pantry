class Pantry
  attr_reader :stock, 
              :shopping_list, 
              :add_to_cookbook,
              :cookbook

  def initialize
    @stock = {}
    @shopping_list = {}
    @add_to_cookbook = {}
    @cookbook = []
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
    @cookbook << r
  end
  
  def what_can_i_make
    total = []
    cookbook.each do |recipe|

      recipe.ingredients.each_pair do |key, value|
        if (stock[key] - value) >= 0 
          total << recipe.name
        end
      end  
    end
    total.uniq
  end

  def how_many_can_i_make
    
  end

end








