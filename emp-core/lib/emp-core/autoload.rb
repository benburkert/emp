module Emp
  autoload :Bootloader,   'emp-core' / :bootloader
  autoload :Dispatcher,   'emp-core' / :dispatcher
  autoload :EmpComponent, 'emp-core' / :component / :emp_component
  autoload :XmppHandler,  'emp-core' / :event_machine / :handler
  autoload :Jid,          'emp-core' / :jid / :jid
  autoload :PostInit,     'emp-core' / :post_init
  autoload :Route,        'emp-core' / :route / :route
  autoload :Router,       'emp-core' / :route / :router
  autoload :XmlHandler,   'emp-core' / :libxml / :handler
end

require 'emp-core' / :core_ext / :array
require 'emp-core' / :core_ext / :object
require 'emp-core' / :core_ext / :string

require 'emp-core' / :libxml_ext / :node
require 'emp-core' / :libxml_ext / :node_map

require 'emp-core' / :nodes / :node
require 'emp-core' / :nodes / :auth
require 'emp-core' / :nodes / :bind
require 'emp-core' / :nodes / :body
require 'emp-core' / :nodes / :challenge
require 'emp-core' / :nodes / :doctype
require 'emp-core' / :nodes / :jid_node
require 'emp-core' / :nodes / :mechanism
require 'emp-core' / :nodes / :mechanisms
require 'emp-core' / :nodes / :register
require 'emp-core' / :nodes / :resource
require 'emp-core' / :nodes / :session
require 'emp-core' / :nodes / :stream
require 'emp-core' / :nodes / :stream_features
require 'emp-core' / :nodes / :success

require 'emp-core' / :stanzas / :stanza
require 'emp-core' / :stanzas / :info_query
require 'emp-core' / :stanzas / :message
require 'emp-core' / :stanzas / :presence