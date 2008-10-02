require File.join(File.dirname(__FILE__), "..", "..", "..", "spec_helper")

describe Emp::XmppHandler do
  describe "#initialize" do
    before(:each) do
      @sig = mock(:sig)
    end

    it "should require a client" do
      lambda { Emp::XmppHandler.new(@sig) }.should raise_error(ArgumentError)
    end

    it "should set the client's xmpp_handler" do
      client = mock(:client)
      client.should_receive(:xmpp_handler=)

      Emp::XmppHandler.new(@sig, client)
    end
  end

  describe "send_data" do
    before(:each) do
      @client, @sig = mock(:client), mock(:sig)
      @client.stub!(:xmpp_handler=)

      @handler = Emp::XmppHandler.new(@sig, @client)
    end

    it "should call #to_xml on the data" do
      pending "move to integration specs"

      data = mock(:data)
      data.should_receive(:to_xml).and_return ""

      @handler.send_data data
    end
  end
end