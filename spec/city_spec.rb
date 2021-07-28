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
      city.update("Vancouver")
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

  describe('#cities') do
    it("returns a train's stops") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      train = Train.new({:name => "Blue", :id => nil, :time => 1})
      train.save()
      train2 = Train.new({:name => "Red", :id => nil, :time => 1})
      train2.save()
      expect(city.trains).to(eq([train, train2]))
    end
  end
end