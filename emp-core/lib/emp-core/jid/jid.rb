module Emp
  #TODO: this class has tacked on too much functionality, figure out a less fuzzy approach
  class Jid
    class << self
      attr_accessor :jid_table, :jid_list
    end

    self.jid_table = Hash.new {|h, host| h[host] = Hash.new {|h, node| h[node] = {}}}
    self.jid_list = []

    attr_accessor :node, :host, :passwd, :resource, :xmpp_handler, :xml_handler

    def self.parse(uri, passwd = nil)
      #...
    end

    def self.default
      @default ||= self.new(Emp.node, Emp.host, '', Emp.passwd)
    end

    def self.find_or_create(node, host, resource, passwd = nil)
      self.jid_table[node][host][resource] ||= self.new(node, host, resource, passwd)
    end

    def initialize(node, host, resource, passwd = nil)
      @node, @host, @passwd, @resource = node, host, passwd, resource
      self.class.jid_table[host][node][resource] = self
      self.class.jid_list << self
    end

    def to_s
      s = "#{node}@#{host}"
      s << "/#{resource}" unless resource.blank?
      s
    end
  end
end