# Respond to server pings

def ping_pong(raw)
    /^PING :(.+)$/i.match(raw)
    puts "> PONG #{$1}"
    @irc.puts "PONG #{$1}"
end

def gethooks()
    hooks = {}

    hooks[/^PING :(.+)$/i] = :ping_pong

    hooks
end
