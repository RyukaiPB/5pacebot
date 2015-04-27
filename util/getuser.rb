#extract user from message

def getuser(msg)
    if /PRIVMSG/ =~ msg then
        usr = msg.split('!')[0]
        usr = usr[1..-1]
    end
end
