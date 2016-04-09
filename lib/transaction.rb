class Transaction
  attr_accessor :id, :customer, :product, :tax

    @@id = 1
    @@transactions = []

  def initialize(customer, product, tax=10)
    @id = @@id
    @@id += 1

    @customer = customer
    @product = product
    @tax = tax
    @sales_total = sales_total
    create_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions[id - 1]
  end

  def sales_total #Calculates sales total with tax
    product.price + ((tax * 0.01) * product.price).round(2)
  end

  def delete
    @@transactions.delete_if { |transaction| transaction if transaction == self}
  end

  private

  def create_transaction
    # raise ProductStockError, " '#{product.title}' has '#{product.stock}' stock" if product.stock <= 0
    @@transactions << self
    product.reduce_stock  # Method is found in product.rb
  end
end
