module LibXML::XML
  class Node
    class << self
      alias super_new new
    end

    def self.register(element)
      NodeMap[element] = self
    end

    def self.new(*args)
      args, opts = args_and_opts(*args)
      node = if !args.empty? || self == LibXML::XML::Node
        super_new(*(args << opts))
      else
        super_new(NodeMap.lookup(self))
      end

      self.default_attributes.merge(opts).each do |k,v|
        node[k] = v
      end

      node
    end
  end
end