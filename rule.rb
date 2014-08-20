class Rule
  attr_reader :item, :unit_price, :special_price

  def initialize options
    @item = options[:item]
    @unit_price = options[:unit_price]
    @special_price = options[:special_price]
  end

  def total_price_item counts
    return total_price_item = self.unit_price if self.special_price.nil?
    
    rest = counts % self.special_price[:qtd]
    prod = counts / self.special_price[:qtd]
    
    total_price_item = (rest * self.unit_price) + (prod * self.special_price[:price])
  end
end