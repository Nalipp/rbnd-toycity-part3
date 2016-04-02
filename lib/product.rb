class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def add_to_products
    # @@products.each { |product| raise DuplicateProductError, " #{title} is already in the database" if product.title == title }
    @@products << self
  end

  def self.find_by_title(item_title)
    @@products.map { |product| product if product.title == item_title}.compact
  end

  def self.all
    @@products
  end
end
