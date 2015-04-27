def hello_hi(raw)
    msg "Well hello there #{getuser(raw)}!"
end

def gethooks()
    hooks = Hash.new(0)

    hooks[genmsg "!hi"] = :hello_hi

    return hooks
end
