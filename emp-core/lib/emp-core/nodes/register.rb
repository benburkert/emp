module Emp
  class Register < Node
    register "register"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      #...
    end
  end
end