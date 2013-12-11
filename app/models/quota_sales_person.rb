class QuotaSalesPerson < Employee
  attr_reader :quota

  def initialize(data)
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
    @base_pay = data["base_pay"]
    @sales = Sale.all_sales
    @bonus_counter = 0
    @sales.each do |sale|
      if sale["last_name"] == @last_name
        @bonus_counter += sale['gross_sale_value'].to_f
        # @@all_employees << @bonus_counter
      end
    end

  end

  def net_pay_after_tax
    super + (@bonus.to_f * 0.7)
  end

end