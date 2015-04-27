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

#load utility functions
def loadutil()
    util = Dir.glob("util/*.rb")
    util.each do |x|
        puts "Loading util: #{x}"
        load x
    end
end
loadutil

#load @hooks
@hooks = Hash.new(0)
def loadplugins()
    files = Dir.glob("plugins/*.rb")
    @hooks = Hash.new(0)
    files.each do |x|
        puts "Loading plugin: #{x}"
        #require_relative(x)
        load x
        gethooks().each_pair do |y,z|
            @hooks[y] = z
        end
    end
end
loadplugins

def runplugins(raw)
    @hooks.each_key do |hook|
        #r = Regexp.new hook
        #if raw =~ r then
        if raw =~ hook then
            send @hooks[hook],raw
        end
    end
end

#connect
@irc.puts "PASS #{pass}"
@irc.puts "NICK #{@user}"
@irc.puts "JOIN #{@chan}"

while true
    ready = select([@irc, $stdin], nil, nil, nil)
    next if !ready

    for s in ready[0]
        #debug
        if s == $stdin
            then
            return if $stdin.eof
            s = $stdin.gets
            @irc.send "#{s}\n", 0
        #data
        elsif s == @irc then
            return if @irc.eof
            s = @irc.gets
            puts "< #{s}"

            #allow each plugin to handle the message
            runplugins(s)
        end
    end
end
