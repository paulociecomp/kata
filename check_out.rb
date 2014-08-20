class CheckOut
  def initialize rules
    @itens = []
    @rules = rules
    @total = 0
  end

  def scan item
    @itens << item
    itens = @itens.uniq
    total = 0

    itens.each do |item|
      total += calc_total_by item
    end

    @total = total
  end

  def calc_total_by item
    counts = 0
    
    rule = get_rule_by item
    @itens.each { |i| counts += 1 if i == item }

    if rule[:special_price].nil?
      total_price_item = rule[:unit_price]
    else
      rest = counts % rule[:special_price][:qtd]
      prod = counts / rule[:special_price][:qtd]
      
      total_price_item = (rest * rule[:unit_price]) + (prod * rule[:special_price][:price])

    end

    total_price_item
  end

  def get_rule_by(item)
    rule = nil

    @rules.each do |r|
      rule = r if item == r[:item]
    end

    rule
  end

  def total
    @total
  end
end