
class CashRegister
  attr_accessor :discount, :total
  attr_reader :items, :prices
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end


  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times {@items.push(title)}
    @prices << price * quantity
  end

  def apply_discount

    if self.discount != 0
      self.total = self.total * (100 - self.discount) / 100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply." 
    end
  end

  def void_last_transaction
    self.total -= @prices.pop
  end


end
