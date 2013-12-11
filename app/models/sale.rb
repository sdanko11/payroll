class Sale
  attr_reader :data, :gross_sales_value, :last_name
  @@all_sales = []

  def initialize(data)
    @gross_sales_value = data["gross_sale_value"]
    @last_name = data["last_name"]
  end

  def self.load_sales
    monthly_sales = 'public/monthly_sales.csv'
    @@all_sales = []
    CSV.foreach(monthly_sales, headers:true) do |row|
      data = row.to_hash
        @@all_sales << data
    end
  end

  def self.all_sales
    @@all_sales
  end

  def sales
    @@all_sales.each do |sale|
      sale["last_name"] ==
      @sales_total += sale["gross_sale_value"].to_f
    end
    @sales_total = @sales_total.round(2)
  end

end