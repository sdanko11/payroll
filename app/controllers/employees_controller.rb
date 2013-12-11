class EmployeesController < ApplicationController
  
  def index

    Sale.load_sales
    Employee.load_employees
    @employees = Employee.all_employees
    # load all employees assign them to an instance varible
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

end
