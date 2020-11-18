
class CashRegister
  attr_accessor :discount, :total
  attr_reader :items, :prices
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end


  def add_item(title, price, quantity = nil)
    quantity ||= 1
    self.total += price * quantity
    quantity.times {@items.push(title)}
    @prices.push(price)
  end

  def apply_discount
    self.discount ||= 0
    if self.discount != 0
      self.total = self.total * (100 - self.discount) / 100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply." 
    end
  end

  def void_last_transaction
    self.total -= quantity_last_item * self.prices[-1]
  end

  def quantity_last_item
    count = 1
    items_reverse = @items.reverse
    items_reverse.each_with_index do |item,idx|
      if items_reverse[idx+1] != item
        return count
      else
        count += 1
      end
    end
    count
  end

end
