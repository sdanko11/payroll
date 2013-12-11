class Owner < Employee
  attr_reader :quota

  def initialize(data)
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
    @base_pay = data["base_pay"]
    @sales = Sale.all_sales
    @sales_total = 0
    @sales.each do |sale|
        @sales_total += sale['gross_sale_value'].to_f
    end
  end

  def net_pay_after_tax
    if @sales_total > 250000
      @base_pay.to_f/12 + (@bonus.to_f * 0.7)
    else
      @base_pay.to_f/12
    end
  end
end