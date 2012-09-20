Postman
=======
Actor model implementation with Ruby and ZeroMQ

Purpose
-------
Build an application by creating stand-alone Actor style 'Agents', and connecting them  
together in a Data-Flow-Programming kind of way.

Objective
-------
Write small specific Agents, that do one thing. Connect Agents together to build an application.

Design
-------
Agent - any old code.  
Mailbox - the client API that each Agent implements. Use the mailbox to send and 
receive messages between Agents.  
Postman - is the server. He is the router of messages between Agents.  

Example
-------
agent_one agent_two agent_three are the example files.

to run the example: start Postman:
> ruby postman.rb run

start agents two and three:
> ruby agent_two.rb run  
> ruby agent_three.rb run  

start agent one last, as this one kicks things off, pass in number of messages to send:
> ruby agent_one.rb run 1000

check output of agent_three
