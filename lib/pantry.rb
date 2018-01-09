class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(food)
    if !@stock.has_key?(food)
      0
    else
      @stock[food]
    end
  end

  def restock(food, num)
    if stock.has_key?(food)
      stock[food] += num
    else
      stock[food] = num
    end
  end

end
