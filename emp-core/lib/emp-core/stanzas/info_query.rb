module Emp
  class InfoQuery < Stanza
    register 'iq'

    def self.set(attributes = {})
      new(attributes.merge('type' => 'set'))
    end
  end
end