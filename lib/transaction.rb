class Transaction
  attr_accessor :id, :customer, :product

    @@id = 0
    @@transactions = []

  def initialize(customer, product)
    @id = @@id
    @id += 1

    @customer = customer
    @product = product
    create_transaction
  end

  def self.all
    @@transactions
  end



  private

  def create_transaction
    raise ProductStockError, " '#{product.title}' has '#{product.stock}' stock" if product.stock <= 0
    @@transactions << self
    product.reduce_stock  # Method is found in product.rb
  end
end
