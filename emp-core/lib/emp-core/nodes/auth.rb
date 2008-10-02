module Emp
  class Auth < Node
    register 'auth'

    self.default_attributes = {
      'xmlns'         => 'urn:ietf:params:xml:ns:xmpp-sasl'
    }

    def self.plain(jid)
      content = Base64::encode64("#{jid.node}@#{jid.host}\x00#{jid.node}\x00#{jid.passwd}").gsub(/\s/, '')
      plain = new('mechanism' => 'PLAIN')
      plain.content = content
      plain
    end

    def self.digest_md5
      new('mechanism' => 'DIGEST-MD5')
    end
  end
end
