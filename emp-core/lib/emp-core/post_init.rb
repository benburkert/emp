module Emp
  class PostInit
    cattr_accessor :callback_map
    self.callback_map = Hash.new {|h, k| h[k] = []}

    def self.add_callback(jid, &proc)
      self.callback_map[jid] << proc
    end
  end
end