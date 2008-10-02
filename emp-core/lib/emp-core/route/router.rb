module Emp

  # A stupid simple router
  class Router
    class << self
      attr_accessor :jid_stack, :prep_procs
    end

    self.prep_procs = []

    def self.prepare(&blk)
      self.prep_procs << blk
    end

    def self.run
      self.prep_procs.each do |proc|
        self.jid_stack = [Jid.default]
        instance_eval(&proc)
      end
    end

    def self.resource(name, &blk)
      self.jid_stack << Jid.find_or_create(Emp.node, Emp.host, name, Emp.passwd)
      instance_eval(&blk)
      self.jid_stack.pop
    end

    def self.route(stanza, attrs = {})
      Dispatcher.add_route(Route.new(self.jid_stack.last, stanza, attrs))
    end
  end
end