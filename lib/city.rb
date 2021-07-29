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
        DB.exec("INSERT INTO stops (train_id, city_id) VALUES (#{train['id'].to_i}, #{city.id.to_i});")
      end
    end
  end

  def delete
    DB.exec("DELETE FROM cities WHERE id = #{@id};")
  end

  def train
    Train.find(@city_id)
  end

# def self.find_by_train(trn_id)
#     cities = []
#     results = DB.exec("SELECT train_id FROM stops WHERE train_id = #{@id};")
#     results.each() do |result|
#       train_id = result.fetch("train_id").to_i()
#       train = DB.exec("SELECT * FROM cities WHERE id = #{train_id};")
#       name = train.first().fetch("name")
#       cities.push(train.new({:name => name, :id => train_id}))
#     end
#     cities
#   end
# end

  def self.find_by_train(trn_id)
    cityArray = []
    returned_cities = DB.exec("SELECT * FROM stops WHERE train_id = #{trn_id};")
    returned_cities.each() do |city|
      city = DB.exec("SELECT name FROM cities WHERE id = #{city.fetch("city_id")};").first
      cityArray.push(city.fetch("name"))
    end
    cityArray
  end

  def link(trn_id)
    DB.exec("INSERT INTO stops (train_id, city_id) VALUES (#{train.id.to_i}, #{city.id.to_i});")
  end

end


# SELECT trains.* FROM cities
# JOIN stops ON (cities.id = stops.city_id)
# JOIN trains ON (stops.train_id = trains.id)
# WHERE cities.id = 1;

# SELECT cities.* FROM trains
# JOIN stops ON (trains.id = stops.train_id)
# JOIN cities ON (stops.city_id = cities.id)
# WHERE trains.id = 1;