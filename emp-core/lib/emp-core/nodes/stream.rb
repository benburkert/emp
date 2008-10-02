module Emp
  class Stream < Node
    register 'stream:stream'

    self.default_attributes = {
      'xmlns'         => 'jabber:client',
      'xmlns:stream'  => 'http://etherx.jabber.org/streams',
      'version'       => '1.0'
    }

    def self.to(host)
      new('to' => host)
    end

    def valid_for?(jid)
      jid.host == self['from']
    end

    def to_xml
      to_s.gsub(/\/>$/, '>')
    end
  end
end