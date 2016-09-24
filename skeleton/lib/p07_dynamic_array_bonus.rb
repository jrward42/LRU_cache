class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)

  end

  def []=(i, val)
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    @store.length.times do |num|
      if @store[num].nil?
        @store[num] = val
        break
      else

  end

  def unshift(val)
  end

  def pop
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
    @capacity.times do |i|

    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!

    new_array = DynamicArray.new(capacity*2)

    @store.each do |el|
      new_array.store << el
    end

    @store = new_array.store


  end
end
