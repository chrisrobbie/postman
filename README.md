Postman
=======

Actor model implementation with Ruby and ZeroMQ


Purpose
-------
Build an application by creating stand-alone 
Actor style 'Agents', and connecting them 
together in a Data-Flow-Programming kind of way.

Objective
-------
Write small specific Agents, that do one thing. 
Connect Agents together to build an application.

Design
-------
Agent - any old code. 
Mailbox - the client API that each Agent 
implements. Use the mailbox to send and 
receive messages between Agents. 
Postman - is the server. He is the router 
of messages between Agents.