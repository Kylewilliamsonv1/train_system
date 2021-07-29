SimpleCov.start


require('spec_helper')

describe '#Train' do
  describe('.all') do
    it("returns an empty array when there are no trains") do
      expect(Train.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves a train") do
      train = Train.new({:name =>"Killers", :time => 1, :id => nil}) 
      train.save()
      train2 = Train.new({:name =>"Queen", :time => 1, :id => nil}) 
      train2.save()

      expect(Train.all).to(eq([train, train2]))
    end
  end
  describe('#==') do
    it("is the same train if it has the same attributes as another train") do
      train = Train.new({:name =>"Queen", :time => 1, :id => @id})
      train2 = Train.new({:name =>"Queen", :time => 1, :id => @id})
      expect(train).to(eq(train2))
    end
  end
#   describe('.clear') do
#     it("clears all Trains") do
#       Train = Train.new("Killers", nil)
#       Train.save()
#       Train2 = Train.new("Queen", nil)
#       Train2.save()
#       Train.clear()
#       expect(Train.all).to(eq([]))
#     end
#   end
  describe('.find') do
    it("finds an train by id") do
      train = Train.new({:name =>"Killers", :time => 1, :id => nil})
      train.save()
      train2 = Train.new({:name =>"Queen", :time => 1, :id => nil})
      train2.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end
  describe('#update') do
  it("updates an train by id") do
    train = Train.new({:name =>"Killers", :time => 1,  :id => nil})
    train.save()
    train.update({:name =>"The Strokes"})
    expect(train.name).to(eq("The Strokes"))
  end
end
# describe('#update') do
#   it("adds an city to an Train") do
#     train = Train.new(:name =>"Killers", :time => 1, :id => nil)
#       train.save()
#     train.update({:train_name => "Crazy Train"})
#     expect(train.name).to(eq("Crazy Train"))
#   end
# end

  describe('#delete') do
    it("deletes an Train by id") do
    train = Train.new({:name =>"Killers", :time => 1, :id => nil})
    train.save()
    train2 = Train.new({:name =>"Queen", :time => 1, :id => nil})
    train2.save()
    train.delete()
    expect(Train.all).to(eq([train2]))
    end
  end


# describe('#delete') do
#   it("deletes all songs belonging to a deleted Train") do
#     Train = Train.new({:name => "A Love Supreme", :id => nil})
#     Train.save()
#     song = Song.new({:name => "Naima", :Train_id => Train.id, :id => nil})
#     song.save()
#     Train.delete()
#     expect(Song.find(song.id)).to(eq(nil))
#   end
# end
end