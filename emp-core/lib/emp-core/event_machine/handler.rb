module Emp
  class XmppHandler < EventMachine::Connection
    def initialize(jid_and_procs)
      @jid, @post_init_procs = *jid_and_procs
      @jid.xmpp_handler = self
      @xml_handler = Emp::XmlHandler.new(@jid)

      super
    end

    def post_init
      @post_init_procs.each {|proc| proc.call(self) }
    end

    def send_data(data)
      p "CLIENT: #{data.to_xml}"
      super data.to_xml
    end

    def receive_data(data)
      p "SERVER: #{data}"
      @xml_handler.parse(data)
    end
  end
end