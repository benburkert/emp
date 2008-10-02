module Emp
  class Session < Node
    register "session"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
    end
  end
end