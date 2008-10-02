module Emp
  class Bootloader
    cattr_accessor :subclasses, :after_load_callbacks, :before_load_callbacks, :finished
    self.subclasses, self.after_load_callbacks, self.before_load_callbacks, self.finished = [], [], [], []

    def self.inherited(klass)
      subclasses << klass.to_s
      super
    end

    def self.run
      subklasses = subclasses.dup
      until subclasses.empty?
        bootloader = subclasses.shift

        Object.full_const_get(bootloader).run
        self.finished << bootloader
      end
      self.subclasses = subklasses
    end
  end
end

# TODO: figure out a real boot sequence that will handle "encryption, authentication, and resource binding", as well as the presence stuff

class Emp::Bootloader::CompileRoutes < Emp::Bootloader
  def self.run
    Emp::Router.run
  end
end

class Emp::Bootloader::WireDefaultCallbacks < Emp::Bootloader
  def self.run
    Emp::Jid.jid_list.each do |jid|
      Emp::PostInit.add_callback(jid) do |handler|
        handler.send_data([Emp::Doctype, Emp::Stream.to(jid.host)])
      end
    end
  end
end