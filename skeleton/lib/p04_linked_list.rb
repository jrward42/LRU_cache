require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(:head, 0)
    @tail = Link.new(:tail, 0)

    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_link = @head

    until current_link == @tail
      return current_link.val if current_link.key == key
      current_link = current_link.next
    end

    nil
  end

  def include?(key)
    current_link = @head

    until current_link == @tail
      return true if current_link.key == key
      current_link = current_link.next
    end

    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    @tail.prev = new_link
    new_link.next = @tail
    @count += 1

    new_link

  end

  def remove(key)
    current_link = @head

    until current_link == @tail
      break if current_link.key == key
      current_link = current_link.next
    end
    # return nil if current_link == @tail
    current_link.prev.next = current_link.next
    current_link.next.prev = current_link.prev

    @count -=1
  end

  def each
    current_link = @head.next

    until current_link == @tail
      yield(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
