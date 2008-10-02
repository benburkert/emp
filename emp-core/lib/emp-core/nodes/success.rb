module Emp
  class Success < Node
    register "success"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      jid.xmpp_handler.send_data(Stream.to(jid.host))
    end
  end
end