require 'rspec'
require 'lru_cache'

describe LRUCache do
  # let(:size) { LRUCache.new(3) }

  describe '#initialize' do
    it "sets a size" do
      size = 3
      expect(size).to eq(3)
    end
  end

  describe '#count' do
    it "returns length of cache array" do
      @cache = []
      expect(@cache.count).to eq(0)
    end
  end

  describe '#add' do
    it "adds element to cache array" do
      size = 4
      @cache = [3, 4, 5, 6]
      answer = [4, 5, 6, 1]
      expect(@cache.add([1])).to eq(answer)
    end
  end



end
