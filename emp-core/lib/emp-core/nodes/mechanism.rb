module Emp
  class Mechanism < Node
    register "mechanism"

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      if content == "PLAIN"
        jid.xmpp_handler.send_data(Auth.plain(jid))
      end
    end
  end
end