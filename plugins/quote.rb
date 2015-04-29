# fortune-mod!

require 'yaml'

def quote_load()
    puts "Loaded Quotes"
    YAML.load_file("plugins/quote.yaml")
end
def quote_save()
    IO.write("plugins/quote.yaml", YAML.dump(@fortunes))
    puts "Saved quotes"
end
@fortunes ||= quote_load()
@fortcount ||= @fortunes.count

def quote_get(raw)
    @fortunes ||= quote_load()
    @fortcount ||= @fortunes.count
    msg "\"#{@fortunes[rand(@fortcount)]}\""
end
def quote_reload(raw)
    @fortunes = quote_load()
    @fortcount = @fortunes.count
    msg "Reloaded quotes."
end
def quote_add(raw)
    user = getuser(raw)
    if ismod(user) then
        fortune = getmsg(raw)[10..-1].chomp
        @fortunes << fortune
        @fortcount = @fortcount + 1
        msg "Added this quote!"
    else
        msg "You're not a mod #{user}, stop trying."
    end
end
def quote_write(raw)
    quote_save
end

def gethooks()
    hooks = Hash.new(0)

    hooks[genmsg "!quote"       ] = :quote_get
    hooks[genmsg "!requote"     ] = :quote_reload
    hooks[genmsg "!addquote "   ] = :quote_add
    hooks[genmsg "!writequotes" ] = :quote_write

    hooks
end

def input(raw)
    msg = getmsg(raw)
    user = getuser(raw)
    case msg
    when /^!quote/
        @fortunes ||= getfort()
        @fortcount ||= @fortunes.count
        #msg("\"#{@fortunes.sample.chomp}\"")
        msg("\"#{@fortunes[rand(@fortcount)]}\"")
    when /^!reload/
        @fortunes = getfort()
        @fortcount = @fortunes.count
    when /^!addquote /
        if ismod(user) then
            fortune = msg[10..-1]
            @fortunes << fortune
            @fortcount = @fortcount+1
            msg "Added quote: #{fortune}"
        else
            msg "Hey, you're not a mod!"
        end
    when /^!writequotes/
        savefort()
    end
end
