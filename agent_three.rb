#
# The last agent in the line, collect the message and print
#
# USAGE
# ruby agent_three.rb run
#
require './mailbox.rb'

class AgentThree
  def self.run
    msg = Mailbox.recv('agent_three')
    puts "msg: #{msg}"
    
    # sleep(1) # include for eyeball testing
  end
  
end

if ARGV[0] == 'run'
  while true
    AgentThree.run
  end
end

