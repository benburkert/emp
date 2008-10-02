module Emp
  class Challenge < Node
    register "challenge"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      #...
    end
  end
end