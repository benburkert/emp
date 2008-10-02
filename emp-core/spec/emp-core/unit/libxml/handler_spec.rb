require File.join(File.dirname(__FILE__), "..", "..", "..", "spec_helper")

describe Emp::XmppHandler do
  describe "#initialize" do

    it "should require a client" do
      lambda { Emp::XmlHandler.new }.should raise_error(ArgumentError)
    end
  end

  describe "#parse" do
    before(:each) do
      @client, @sig = mock(:client), mock(:sig)
      @client.stub!(:xmpp_handler=)

      @handler = Emp::XmlHandler.new(@client)
    end

    it "should call #to_xml on the data" do
      data = mock(:data)
      data.should_receive(:to_xml).and_return ""

      @handler.parse data
    end
  end
end