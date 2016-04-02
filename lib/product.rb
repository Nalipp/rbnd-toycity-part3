class Product
  attr_accessor :id
    @@id = 1
    @@products = []

  def initialize(options={})
    @id = @@id
    @@id += 1
    @@products << self

    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
  end

  def self.all
    @@products
  end

end
