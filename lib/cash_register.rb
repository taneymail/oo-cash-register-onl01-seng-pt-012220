
class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    @last_transaction = price*quantity

    counter = 0
    while counter < quantity
      @items << title
      counter += 1
    end
  end

  def apply_discount
    if @discount != nil
       @discount = @discount/100.to_f
       @total = @total - (@total * (@discount))
       "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end