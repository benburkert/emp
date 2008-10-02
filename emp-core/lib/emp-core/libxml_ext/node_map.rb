module LibXML::XML::NodeMap
  class << self
    attr_accessor :map
  end

  self.map = {}

  def self.[]=(element, klass)
    self.map[element] = klass
  end

  def self.[](element)
    self.map[element] || LibXML::XML::Node
  end

  def self.lookup(klass)
    self.map.invert[klass]
  end
end