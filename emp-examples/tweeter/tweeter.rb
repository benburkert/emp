$:.unshift "#{File.dirname(__FILE__)}/../../emp-core/lib"

require 'emp-core'
require 'dm-core'

DataMapper.setup(:default, 'sqlite3::memory:')

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :length => 256
  property :passwd, String, :length => 256

  has n, :tweets, :class_name => "Tweet"

  def to_xml
    to_vcard
  end

  def to_vcard
    #...
  end
end

class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :message, String, :length => 160

  belongs_to :user

  def to_xml
    to_atom
  end

  def to_atom
    #...
  end
end

class Tweets < Emp::EmpComponent
  def index
    result Tweet.all # InfoQuery.new(Tweet.all.map{|t| t.to_xml}, :type => :result)
  end

  def show(id)
    result Tweet.get(id) # InfoQuery.new(Tweet.get(id).to_xml, :type => :result)
  end

  # i'm thinking the stanza parameter should always be the XMPP payload, specific parameters
  # can be grabbed from the attributes then inner elements using the merb-action-args approach
  def create(stanza)
    #<iq type='set'><message ...>...</message>...<message ...></message></iq>
    @tweets = stanza.children.map {|m| Tweet.from_xml(m)}

    if @tweets.all? {|t| t.save }
      result :success  # TODO: this is hackish
    else
      # some sort of error response
    end
  end
end

class Users < Emp::EmpComponent
  def index
    result User.all
  end

  def show(id)
    @user = User.get(id) || (raise UserNotFound, id) # raise .. will reply with InfoQuery.new(<some error xml to be determined later>, :type => :error)
  end
end

Emp.setup('tweeter@localhost', 5222, 'p@ssw0rd')

Emp::Router.prepare do

  resource('tweets') do
    # :id => /\d+/ assumes Regex <=> XPath conversion
    route(:info_query, :type => :get, :id => /\d+/).to(:component => 'tweets', :action => 'show')
    route(:info_query, :type => :get).to(:component => 'tweets', :action => 'index')
    route(:info_query, :type => :set, :id => /\d+/).to(:component => 'tweets', :action => 'update')
    route(:info_query, :type => :set).to(:component => 'tweets', :action => 'create')
  end

  resource('tweeters') do
    route(:info_query, :type => :get, :id => /\d+/).to(:compenent => 'tweeters', :action => 'show')
    route(:info_query, :type => :get).to(:component => 'tweets', :action => 'index')
  end
end

Emp.start