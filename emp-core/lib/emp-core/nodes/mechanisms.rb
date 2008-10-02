module Emp
  class Mechanisms < Node
    register "mechanisms"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      children.each {|c| c.handle(jid)}
    end
  end
end