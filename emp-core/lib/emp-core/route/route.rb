module Emp
  class Route
    attr_accessor :jid, :stanza, :attrs, :component, :action

    def initialize(jid, stanza, attrs)
      @jid, @stanza, @attrs = jid, stanza, attrs
    end

    def to(opts, component = opts[:component], action = opts[:action])
      @component, @action = component, action
    end
  end
end