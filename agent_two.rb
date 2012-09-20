#
# Listen for messages and pass on to next agent
#
# USAGE
# ruby agent_two.rb run
#
require './mailbox.rb'

class AgentTwo
  def self.run
    msg = Mailbox.recv('agent_two')
    puts "msg: #{msg}"
    
    Mailbox.post('agent_three', msg)
  end

end

if ARGV[0] == 'run'
  while true
    AgentTwo.run
  end
end


