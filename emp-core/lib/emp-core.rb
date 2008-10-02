require 'rubygems'

require 'base64'
require 'extlib'
require 'eventmachine'
require 'libxml'


module Emp; end

dir = File.dirname(__FILE__) / 'emp-core'

require dir / :autoload

module Emp
  class << self
    attr_accessor :node, :host, :port, :passwd
  end

  def self.setup(identity, port = 5222, passwd = nil)
    self.node, self.host = *identity.split('@')
    self.port, self.passwd = port, passwd
  end

  def self.start
    Emp::Bootloader.run

    EventMachine::run do
      Emp::Jid.jid_list.each do |jid|
        EventMachine::connect Emp.host, Emp.port, Emp::XmppHandler, [jid, Emp::PostInit.callback_map[jid]]
      end
    end
  end
end