# get channel uptime

require 'net/http'

@uri ||= URI("https://nightdev.com/hosted/uptime.php?channel=#{@chan[1..-1]}")

def uptime(raw)
    msg Net::HTTP.get(@uri)
end

def gethooks()
    hooks = Hash.new(0)

    hooks[genmsg '!uptime\s*'] = :uptime

    hooks
end
