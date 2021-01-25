require 'rspec'
require 'lru_cache'

describe LRUCache do 
  subject(:lrucache) { LRUCache.new(4) }

  describe "#initialize" do 
    it "should accept a size(num)" do
      expect(lrucache.size).to eq(4)
      expect(lrucache.cache).to eq([])
    end
  end

  describe "#count" do 
    it "returns number of elements currently in cache" do 
      lrucache.cache << 10
      lrucache.cache << 'hello'
      expect(lrucache.count).to eq(2)
    end
  end

  describe "#add" do
    it 'adds the element to the end of @cache' do
      expect(lrucache.cache).to be_empty
      lrucache.add([1,2,3])
      expect(lrucache.cache).to eq([[1,2,3]])
    end
    
    it 'shifts the first el if @cache is full' do
      lrucache.cache = ["I walk the line",5,[1,2,3],5]
      expect(lrucache.add(-5)).to eq([5,[1,2,3],5,-5])
  end
end

describe "#show" do
  it 'shows items in cache' do
      lrucache.add([1,2,3])
      expect(lrucache.show).to eq([[1,2,3]])
  end
end



end