module Emp
  class Bind < Node
    register "bind"

    self.default_attributes = {
      'xmlns'         => 'urn:ietf:params:xml:ns:xmpp-bind'
    }

    ## HACK: Node's shouldn't have a handle method
    def handle(jid)
      iq = InfoQuery.set('id' => 'bind_1')
      iq << bind = Bind.new

      unless jid.resource.empty?
        bind << resource = Resource.new
        resource.content = jid.resource
      end

      jid.xmpp_handler.send_data(Presence.initial)
    end
  end
end