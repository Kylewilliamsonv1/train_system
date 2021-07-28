class City
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) 
  end

  def self.all
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i
      cities.push(City.new({:name => name, :id => id}))
    end
    cities
  end

  def save
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(city_to_compare)
    self.name() == city_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM cities *;")
  end

  def self.find(id)
    city = DB.exec("SELECT * FROM cities WHERE id = #{id};").first
    name = city.fetch("name")
    id = city.fetch("id").to_i
    City.new({:name => name, :id => id})
  end

  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")
    elsif (attributes.has_key?(:city_name)) && (attributes.fetch(:city_name) != nil)
      city_name = attributes.fetch(:city_name)
      city = DB.exec("SELECT * FROM cities WHERE lower(name)='#{city_name.downcase}';").first
      if city != nil
        DB.exec("INSERT INTO stops (city_id, train_id) VALUES (#{city['id'].to_i}, #{@id});")
      end
    end
  end

  def delete
    DB.exec("DELETE FROM cities WHERE id = #{@id};")
  end

  # def train
  #   Train.find(@city_id)
  # end

end