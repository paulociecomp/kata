class CheckOut
  attr_reader :total

  def initialize rules
    @shopping_cart = []
    @rules = rules
    @total = 0
  end

  def scan item
    @shopping_cart << item
    itens = @shopping_cart.uniq
    @total = 0
    
    itens.each do |item|
      @total += calc_total_by item
    end
  end

  private
    def calc_total_by item
      counts = 0
      rule = get_rule_by item
      rule.total_price_item counts(item)
    end

    def get_rule_by(item)
      rule = nil

      @rules.each do |r|
        rule = r if item == r.item
      end

      rule
    end

    def counts(item)
      counts = 0
      @shopping_cart.each { |i| counts += 1 if i == item }
      counts
    end

end