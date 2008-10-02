module Emp
  class Doctype < Emp::Node

    def self.to_xml
      "<?xml version='1.0'?>"
    end
  end
end