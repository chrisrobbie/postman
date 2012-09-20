#
# Mailbox
#
# client API for agents to receive and post messages
# to and from other agents.
#
# An agent includes this class, then uses recv to receive messages,
# and post to send messages to other agents.
#

require 'ffi-rzmq'

class Mailbox

  @sub = nil; @pub = nil
  @context = ZMQ::Context.new
  
  def self.recv(agent)
    @sub || self.sub_socket(agent)
    @sub.recv_string(msg = '')
    return msg
  end

  def self.sub_socket(agent)
    @sub = @context.socket(ZMQ::SUB)
    # @sub.setsockopt(ZMQ::IDENTITY, "#{agent}")
    @sub.setsockopt(ZMQ::SUBSCRIBE, "#{agent} ")
    @sub.connect("tcp://127.0.0.1:9001")
    @sub
  end
    
  def self.post(agent, mail)
    @pub || self.pub_socket
    @pub.send_string("#{agent} #{mail}")
  end
  
  def self.pub_socket
    @pub = @context.socket(ZMQ::PUB)
    @pub.connect("tcp://127.0.0.1:8001")
    @pub
  end
  
end
