module Emp
  class Node < LibXML::XML::Node
    def self.inherited(klass)
      class << klass
        attr_accessor :default_attributes
      end

      klass.default_attributes = {}
    end

    alias_method :to_xml, :to_s
  end
end