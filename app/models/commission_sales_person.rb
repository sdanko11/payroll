class CommissionSalesPerson < Employee
  attr_reader :commission_rate
  def initialize(data)
    super(data)
    @commission_rate = data["commission_rate"]
    @sales = Sale.all_sales
    @counter_sales = 0
    @sales.each do |sale|
      if sale["last_name"] == @last_name
        @counter_sales += sale['gross_sale_value'].to_f
      end
    end
  end

  def net_pay_before_tax
   super + (@commission_rate.to_f * @counter_sales)
  end

  def total_commission
    @commission_rate.to_f * @counter_sales
  end
end