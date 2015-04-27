# Date / Time thingy for me

def date_date(raw)
    msg "Current Date: #{DateTime.now.strftime("%Y-%-m-%-d")}"
end

def date_time(raw)
    now = DateTime.now
    msg "Time in #{now.strftime "%Z"} timezone: #{now.strftime "%H:%M:%S"}"
end

def gethooks()
    hooks = Hash.new(0)

    hooks[genmsg '!time\s*'] = :date_time
    hooks[genmsg '!date\s*'] = :date_date

    hooks
end
