class Employee
  attr_reader :data, :position, :first_name, :last_name, :base_pay
  @@all_employees = []

  def initialize(data)
    @first_name = data["first_name"]
    @last_name = data["last_name"]
    @base_pay = data["base_pay"]
    @position = data["position"]
  end

  def self.load_employees
    employee_info = 'public/sales.csv'
    @@all_employees = []
    CSV.foreach(employee_info, headers:true) do |row|
      data = row.to_hash
        if data["position"] == 'developer' || data["position"] == 'designer'
         employee =  Employee.new(data)
         @@all_employees << employee
        elsif data["position"] == 'commission sales'
          @@all_employees << CommissionSalesPerson.new(data)
        elsif data["position"] == 'quota sales'
          @@all_employees << QuotaSalesPerson.new(data)
        elsif data["position"] == 'owner'
          @@all_employees << Owner.new(data)
        end
    end
  end

  def self.all_employees
    @@all_employees
  end

  def net_pay_before_tax
    @base_pay.to_f/12
  end

  def net_pay_after_tax
    net_pay_before_tax * 0.7
  end

  def commission
    total_commission
  end

  def self.print_data
    @@all_employees.each do |employee|
      puts "*** #{employee.first_name} #{employee.last_name} ***"
      puts "Gross salary: #{employee.net_pay_before_tax.round(2)}"
      puts "Commission: #{employee.commission}" if employee.position == "commission sales"
      puts "Net pay:      #{employee.net_pay_after_tax.round(2)}"
      puts "***"
    end
  end

end