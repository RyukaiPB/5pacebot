#!/usr/bin/env ruby
require "socket"
require "yaml"

#load settings
options = YAML.load_file("bot.yaml")
host = options['host']
port = options['port']
@chan = "##{options['channel']}"
@user = options['username']
@owner = options['owner']
pass = options['password']

#create socket before loading anything, since some things can depend on it
@irc = TCPSocket.open(host, port.to_i)

load "core/loader.rb" #bootstrap loading the core (loadcore)
loadcore
loadutil
@hooks = Hash.new
loadplugins

@irc.puts "PASS #{pass}"
@irc.puts "NICK #{@user}"
@irc.puts "JOIN #{@chan}"

mainloop

quote_save
savemods
