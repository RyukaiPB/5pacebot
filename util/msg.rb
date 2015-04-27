#send message to channel

def msg(x)
    puts "> #{x}"
    @irc.puts "PRIVMSG #{@chan} :#{x}"
end
