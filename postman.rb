#
# Postman
#
# This is the 'server' component.
# Postman subscribes to messages from Agents,
# and then publishes those messages to other Agents.
#

require 'ffi-rzmq'

class Postman

  def self.sockets(context)
    sub = context.socket(ZMQ::SUB)
    
    # listen for incoming messages on this socket
    sub.setsockopt(ZMQ::SUBSCRIBE, "")
    sub.bind("tcp://127.0.0.1:8001")

    # publish messages on this socket
    pub = context.socket(ZMQ::PUB)
    pub.bind("tcp://127.0.0.1:9001")
    
    return sub, pub
  end

  def self.process(sub, pub)
    sub.recv_string(msg = '')
    pub.send_string(msg)
  end

  def self.run
    context = ZMQ::Context.new
    sub, pub = self.sockets(context)
    
    while true do
      self.process(sub, pub)
    end
    
    sub.close; pub.close
    context.terminate
  end
end

if ARGV[0] == 'run'
  while true do
    Postman.run
  end
end
