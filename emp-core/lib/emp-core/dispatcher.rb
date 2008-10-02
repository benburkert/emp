module Emp
  class Dispatcher
    class << self
      attr_accessor :route_table
    end

    self.route_table = []

    def self.add_route(route)
      route_table << route
      route
    end

    # TODO: this is a huge f'in hack to handle the "encryption, authentication, and resource binding",
    # and it belongs in the Bootloader sequence, not the dispatcher.
    def self.handle(node_or_stanza, jid)
      if node_or_stanza.is_a? Stanza
        if node_or_stanza.is_a? InfoQuery
          set_presence(jid)
        end
      else
        handle_node(node_or_stanza, jid)
      end
    end

    def self.handle_node(node, jid)
      node.handle(jid)
    end

    def self.set_presence(jid)
      jid.xmpp_handler.send_data(Presence.initial(jid))
    end
  end
end