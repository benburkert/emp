$:.unshift "#{File.dirname(__FILE__)}/../../emp-core/lib"

require 'emp-core'

class Hackity < Emp::EmpComponent
  def hack(message)
    reply "Hackity Hack!"   # Message.new("Hackity Hack!")
  end
end


Emp.setup('hackity@localhost', 5222, 'hack')

Emp::Router.prepare do

  # hackity@localhost/hack
  resource('hack') do

    # route(<stanza type>, <matching attributes>)  #TODO: use XPath to route these
    route(:message, :from => 'bar@localhost').to(:component => 'hackity', :action => 'hack')
  end
end

Emp.start