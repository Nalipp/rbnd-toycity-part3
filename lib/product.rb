class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.product(num)
    @@products[num]
  end

  def add_to_products
    # @@products.each { |product| raise DuplicateProductError, " #{title} is already in the database" if product.title == title }
    @@products << self
  end

  def self.find_by_title(item_title)
    @@products.each { |product| return product if product.title == item_title }
  end

  def in_stock?
    self.stock > 0 ? true : false
  end

  def include?(array)
    self.array
  end

  def self.in_stock
    @@products.map { |product| product if product.stock > 0 }
  end

  def self.all
    @@products
  end
end
