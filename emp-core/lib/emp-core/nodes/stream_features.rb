module Emp
  class StreamFeatures < Node
    register 'stream:features'

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      children.each {|c| c.handle(jid)}
    end
  end
end