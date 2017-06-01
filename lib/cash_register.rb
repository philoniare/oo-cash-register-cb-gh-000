class CashRegister
  attr_accessor :total, :discount
  ITEMS = []
  def initialize(discount=0)
    @total = 0
    @discount = discount
    ITEMS.clear
  end
  def void_last_transaction
    last_item_name, last_item_price = ITEMS.pop
    @total -= last_item_price
  end
  def items
    ITEMS.collect{|item| item[0]}
  end
  def add_item(item_name, price, quantity=1)
    @total += (price * quantity)
    quantity.times{
      ITEMS << [item_name, price]
    }
  end
  def apply_discount
    if @discount > 0
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
end
