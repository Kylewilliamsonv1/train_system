require 'simplecov'
SimpleCov.start
require('spec_helper')

describe '#City' do

  describe('.all') do
    it("returns an empty array when there are no cities") do
      expect(City.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a city") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Eugene", :id => nil})
      city2.save()
      expect(City.all).to(eq([city, city2]))
    end
  end

  describe('.clear') do
    it("clears all cities") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Eugene", :id => nil})
      city2.save()
      City.clear
      expect(City.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same city if it has the same attributes as another city") do
      city = City.new({:name => "Portland", :id => nil})
      city2 = City.new({:name => "Portland", :id => nil})
      expect(city).to(eq(city2))
    end
  end

  describe('.find') do
    it("finds a city by id") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Eugene", :id => nil})
      city2.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end

  describe('#update') do
    it("updates a city by id") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city.update({:name => 'Vancouver'})
      expect(city.name).to(eq("Vancouver"))
    end
  end

  describe('#delete') do
    it("deletes all cities belonging to a deleted train") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "San Francisco", :id => nil})
      city2.save()
      city.delete()
      expect(City.all).to(eq([city2]))
    end
  end

  describe('.find_by_train') do
    it("finds cities for a train") do
      train = Train.new({:name =>"Killers", :time => 1,  :id => nil})
      train.save
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "San Francisco", :id => nil})
      city2.save()
      DB.exec("INSERT INTO stops (train_id, city_id) VALUES (#{train.id.to_i}, #{city.id.to_i});")
      expect(City.find_by_train(train.id)).to(eq(["Portland"]))
    end
  end

  # describe('#cities') do
  #   it("returns a train's stops") do
  #     city = City.new({:name => "Portland", :id => nil})
  #     city.save()
  #     train = Train.new({:name => "Blue", :id => nil, :time => 1})
  #     train.save()
  #     train2 = Train.new({:name => "Red", :id => nil, :time => 1})
  #     train2.save()
  #     expect(city.train).to(eq([train, train2]))
  #   end
  # end
end