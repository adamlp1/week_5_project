require_relative('../db/sql_runner.rb')

class Product

  attr_accessor :name, :description, :stock, :buy_cost, :sell_price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock = options['stock'].to_i
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save()
    sql = "INSERT INTO products
    (
      name,
      description,
      stock,
      buy_cost,
      sell_price
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @description, @stock, @buy_cost, @sell_price]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE products
    SET
    (
      name,
      description,
      stock,
      buy_cost,
      sell_price
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @description, @stock, @buy_cost, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM products
            ORDER BY name"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product) }
    return result
  end

  def self.find(id)
    sql = "SELECT * from products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    product = Product.new(result)
    return product
  end















end
