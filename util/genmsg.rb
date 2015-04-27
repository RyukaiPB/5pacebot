#extract message from raw data

def genmsg(query)
    search = /PRIVMSG #{@chan} :#{query}/
end

def getmsg(raw)
    search = /PRIVMSG #{@chan} :/
    res = raw =~ search
    if res then
        return raw [res+search.source.length..-1]
    end
    nil
end
