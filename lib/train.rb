require('pry')

class Train
  attr_reader :id
  attr_accessor :name, :time

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @time = attributes.fetch(:time)
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
    Trains
  end
  def save
    result = DB.exec("INSERT INTO trains (name, time) VALUES ('#{@name}','#{@time}') RETURNING id;")
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
    id = train.fetch("id").to_id
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
  #   elsif (attributes.has_key?(:album_name)) && (attributes.fetch(:album_name) != nil)
  #     album_name = attributes.fetch(:album_name)
  #     album = DB.exec("SELECT * FROM albums WHERE lower(name)='#{album_name.downcase}';").first
  #     if album != nil
  #       DB.exec("INSERT INTO albums_Trains (album_id, Train_id) VALUES (#{album['id'].to_i}, #{@id});")
  #     end
  #   end
  # end

  # def albums
  #   albums = []
  #   results = DB.exec("SELECT album_id FROM albums_Trains WHERE Train_id = #{@id};")
  #   results.each() do |result|
  #     album_id = result.fetch("album_id").to_i()
  #     album = DB.exec("SELECT * FROM albums WHERE id = #{album_id};")
  #     name = album.first().fetch("name")
  #     albums.push(Album.new({:name => name, :id => album_id}))
  #   end
  #   albums
  # end
  def delete
    DB.exec("DELETE FROM trains *;")
  end
  

end