class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.map{|el| el.hash}.join.to_i
  end
end

class String
  def hash
    self.chars.map{|el| el.ord.hash}.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.map{|key| key.to_s.hash}.join.to_i
  end
end
