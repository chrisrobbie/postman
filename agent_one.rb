#
# Kick things off, pass a bunch of messages to another agent
#
# USAGE:
# ruby agent_one.rb run 1000
# method to call, name of agent, number of messages
#
require './mailbox.rb'

class AgentOne
  def self.run(agent, msg)
    Mailbox.post(agent, msg)
  end
end

if ARGV[0] == 'run'
  ARGV[1].to_i.times do |x|
    AgentOne.run 'agent_two', x
    
    # sleep 1 # include a sleep here to eyeball things
  end
end
