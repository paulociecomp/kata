class Rule
  attr_reader :item, :unit_price, :special_price

  def initialize(options)
    @item = options[:item]
    @unit_price = options[:unit_price]
    @special_price = options[:special_price]
  end

  def total_price_item(number_of_items)
    return total_price_item = unit_price if special_price.nil?
    
    number_of_items_with_unit_price = calculate_number_of_items_with_unit_price(number_of_items)
    groups_of_items_with_special_price = calculate_groups_of_items_with_special_price(number_of_items)
    
    calculate_total_price(number_of_items_with_unit_price, groups_of_items_with_special_price)
  end

  private

  def calculate_number_of_items_with_unit_price(number_of_items)
    number_of_items % special_price[:qtd]
  end

  def calculate_groups_of_items_with_special_price(number_of_items)
    number_of_items / special_price[:qtd]
  end

  def calculate_total_price(number_of_items_with_unit_price, groups_of_items_with_special_price)
    (number_of_items_with_unit_price * unit_price) + (groups_of_items_with_special_price * special_price[:price])
  end
end