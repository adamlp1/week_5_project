require_relative('../db/sql_runner.rb')

class Manufacturer

attr_reader :name, :id

def initialize(options)
  @name = options['name']
  @id = options['id'].to_i if options['id']
end

def save()
  sql = "INSERT INTO manufacturers
  (
    name
  )
  VALUES
  (
    $1
  )
  RETURNING id"
  values = [@name]
  result = SqlRunner.run(sql, values)
  id = result.first["id"]
  @id = id.to_i
end

def update()
  sql = "UPDATE manufacturers
  SET
  (
    name
  ) =
  (
    $1
  )
  WHERE id = $2"
  values = [@name]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM manufacturers;"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM manufacturers"
  manufacturers = SqlRunner.run(sql)
  reuslt = manufacturers.map { |manufacturer| Manufacturer.new(manufacturer) }
  return result
end

def self.find(id)
  sql = "SELECT * FROM manufacturers WHERE id = $1"
  values = [id]
  manufacturer = SqlRunner.run(sql, values)
  result = Manufacturer.new(manufacturer.first)
  return result
end

def update
















end
