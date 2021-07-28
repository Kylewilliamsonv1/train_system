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
      train = Train.new(:name =>"Killers", :id => nil) 
      train.save()
      train2 = Train.new(:name =>"Queen", :id => nil) 
      train2.save()
      expect(Train.all).to(eq([Train, Train2]))
    end
  end
  describe('#==') do
    it("is the same Train if it has the same attributes as another Train") do
      Train = Train.new(:name =>"Queen", :id => @id)
      Train2 = Train.new(:name =>"Queen", :id => @id)
      expect(Train).to(eq(Train2))
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
    it("finds an Train by id") do
      Train = Train.new(:name =>"Killers", :id => nil)
      Train.save()
      Train2 = Train.new(:name =>"Queen", :id => nil)
      Train2.save()
      expect(Train.find(Train.id)).to(eq(Train))
    end
  end
  describe('#update') do
  it("updates an Train by id") do
    Train = Train.new(:name =>"Killers", :id => nil)
    Train.save()
    Train.update("The Strokes")
    expect(Train.name).to(eq("The Strokes"))
  end
end
# describe('#update') do
#   it("adds an album to an Train") do
#     Train = Train.new({:name => "John Coltrane", :id => nil})
#     Train.save()
#     album = Album.new({:name => "A Love Supreme", :id => nil})
#     album.save()
#     Train.update({:album_name => "A Love Supreme"})
#     expect(Train.albums).to(eq([album]))
#   end
# end
  describe('#delete') do
    it("deletes an Train by id") do
    Train = Train.new(:name =>"Killers", :id => nil)
    Train.save()
    Train2 = Train.new(:name =>"Queen", :id => nil)
    Train2.save()
    Train.delete()
    expect(Train.all).to(eq([Train2]))
    end
  end
# describe('#songs') do
#     it("returns an Train's songs") do
#       Train = Train.new({:name =>"Killers", :id => nil})
#       Train.save()
#       song = Song.new({:name =>"Naima", :Train_id => Train.id, :id =>  nil})
#       song.save()
#       song2 = Song.new({:name =>"Cousin Mary", :Train_id => Train.id, :id =>  nil})
#       song2.save()
#       expect(Train.songs).to(eq([song, song2]))
#     end
#   end

# # describe('#search') do
# # it('searches an Train by name') do
# #   Train = Train.new("Killers", nil)
# #   Train.save()
# #   Train2 = Train.new("Queen", nil)
# #   Train2.save()
# #   expect(Train.search("Queen")).to(eq(Train2))
# # end
# # end

# # describe('#sort') do
# #     it("sort an Train") do
# #       Train = Train.new("Killers", nil) # nil added as second argument
# #       Train.save()
# #       Train2 = Train.new("Queen", nil) # nil added as second argument
# #       Train2.save()
# #       expect(Train.sort).to(eq([Train2, Train]))
# #     end
# # end

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