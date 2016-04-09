class Customer
  attr_accessor :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def add_to_customers
    @@customers.each { |customer| raise DuplicateCustomerError, " '#{name}' is already in the database" if customer.name == name }
    @@customers << self
  end

  def self.find_by_name(customer_name)
    @@customers.map { |customer| return customer if customer.name = customer_name}
  end

  def purchase(item_title)
    Transaction.new(self, item_title)
  end
end
