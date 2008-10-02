module Emp
  class Presence < Stanza
    register 'presence'

    def self.available(jid)
      new('type' => 'available', 'from' => jid.to_s)
    end

    # TODO: this ain't working, need to dig around in xmpp4r some more
    def self.initial
      new
    end
  end
end