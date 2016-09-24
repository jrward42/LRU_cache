require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      update_link!(@map.get(key))
    else
      eject!
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    store_link = @store.insert(key, @prc.call(key))
    @map.set(key, store_link)
    store_link.val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove(link.key)
    @store.insert(link.key, link.val)
    link.val
  end

  def eject!
    if @store.count == @max
      @map.delete(@store.first.key)
      @store.remove(@store.first.key)
    end
  end

end
