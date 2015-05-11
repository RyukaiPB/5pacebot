#!help command

def help(raw)
    keys = @hooks.keys
    act_keys = []
    keys.each do |x|
        act_keys << x.source
    end
    res = "The following keys exist:"
    act_keys.each do |x|
        # we only want commands to show
        if x =~ /PRIVMSG #{@chan} :!/ then
            res << " "
            x.gsub!(/PRIVMSG #{@chan} :/, '')
            res << '\'' << x << '\''
        end
    end
    msg res
end

def gethooks
    hooks = {}

    hooks[genmsg '!help'] = :help

    hooks
end
