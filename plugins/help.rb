#!help command

def help(raw)
    keys = @hooks.keys
    act_keys = []
    keys.each do |x|
        act_keys << x.source
    end
    res = "The following keys exist:"
    act_keys.each do |x|
        res << " "
        x.gsub!(/PRIVMSG #{@chan} :/, '')
        res << '\'' << x << '\''
    end
    msg res
end

def gethooks
    hooks = Hash.new()

    hooks[genmsg '!help'] = :help

    hooks
end
