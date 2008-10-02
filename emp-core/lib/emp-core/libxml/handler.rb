module Emp
  class XmlHandler
    include LibXML::XML::SaxParser::Callbacks

    def initialize(jid)
      @jid = jid
      @jid.xml_handler = self
      @parser = LibXML::XML::SaxParser.new
      @parser.callbacks = self
      @stack = []
    end

    def parse(data)
      @parser.string = data.to_xml
      @parser.parse
    end

    def on_start_element(element, attributes = {})
      case element
      when 'stream:stream'
        raise "you crossed the streams!" unless Stream.new(attributes).valid_for?(@jid)
      else
        child, parent = LibXML::XML::NodeMap[element].new(attributes), @stack.last

        parent << child unless parent.nil?
        @stack << child
      end
    end

    def on_end_element(element)
      last = @stack.pop

      raise "element mismatch: #{last.name} != #{element}" if last.name != element

      Emp::Dispatcher.handle(last, @jid) if @stack.empty?
    end

    def on_characters(text)
      @stack.last.content = text
    end

    #def method_missing(method_name, *attributes, &block)
    #  p [method_name, attributes, block]
    #end
  end
end