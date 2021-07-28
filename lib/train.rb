require('pry')

class Train
  attr_reader :id
  attr_accessor :name, :time

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @time = attributes.fetch(:time).to_i
    @id = attributes.fetch(:id) 
  end
  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      time = train.fetch("time").to_i
      id = train.fetch("id").to_i
      trains.push(Train.new({:name => name, :time => time, :id => id}))
    end
    trains
  end
  def save
    result = DB.exec("INSERT INTO trains (name, time) VALUES ('#{@name}', '#{@time}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  def ==(train_to_compare)
    ((self.name() == train_to_compare.name()) && (self.id() == train_to_compare.id()))
  end
  # def self.clear
  #   DB.exec("DELETE FROM Trains *;")
  # end
  def self.find(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first
    name = train.fetch("name")
    time = train.fetch("time").to_i
    id = train.fetch("id").to_i
    Train.new({:name => name, :time => time, :id => id})
  end
  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

  # def update(attributes)
  #   if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
  #     @name = attributes.fetch(:name)
  #     DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  #   elsif (attributes.has_key?(:city_name)) && (attributes.fetch(:city_name) != nil)
  #     city_name = attributes.fetch(:city_name)
  #     city = DB.exec("SELECT * FROM cities WHERE lower(name)='#{city_name.downcase}';").first
  #     if city != nil
  #       DB.exec("INSERT INTO stops (city_id, Train_id) VALUES (#{city['id'].to_i}, #{@id});")
  #     end
  #   end
  # end

  def train
    cities = []
    results = DB.exec("SELECT city_id FROM stops WHERE train_id = #{@id};")
    results.each() do |result|
      city_id = result.fetch("city_id").to_i()
      city = DB.exec("SELECT * FROM cities WHERE id = #{city_id};")
      name = city.first().fetch("name")
      cities.push(city.new({:name => name, :id => city_id}))
    end
    cities
  end
  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
  end

  # def cities
  #   City.find_by_train(self.id)
  # end
  
end