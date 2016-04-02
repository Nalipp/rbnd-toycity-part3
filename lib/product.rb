class Product
  attr_reader :title

  @@titles = []
  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def add_to_products
    if @@titles.include? @title
      # raise DuplicateProductError " #{title} is already in the database"
    else
      @@titles << @title
      @@products << self
    end
  end

  def self.all
    @@products
  end
end
