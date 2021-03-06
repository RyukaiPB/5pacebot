# mod managing plugin

def modmanage_addmod(raw)
    if getuser(raw) == @owner then
        message = getmsg(raw)
        newuser = message.split[1].chomp
        if ismod(newuser) then
            msg "#{newuser} is already a mod!"
        else
            addmod newuser
            msg "Added #{newuser} as a mod."
        end
    else
        msg "Oh no you don't!"
    end
end
def modmanage_listmods(raw)
    res = "The mods of this channel are:"
    listmods().each do |x|
        res << " "
        res << x
    end
    res << "."
    msg res
end
def modmanage_delmod(raw)
    if getuser(raw) == @owner then
        message = getmsg(raw)
        newuser = message.split[1].chomp
        if ismod(newuser) then
            delmod newuser
            msg "Sorry #{newuser} you're not a mod anymore!"
        else
            msg "#{newuser} not a mod!"
        end
    else
        msg "Oh no you don't!"
    end
end
def modmanage_savemods(raw)
    savemods()
    msg "Saved mods to database."
end

def gethooks()
    hooks = {}

    hooks[genmsg '!addmod'  ] = :modmanage_addmod
    hooks[genmsg '!mods'    ] = :modmanage_listmods
    hooks[genmsg '!delmod'  ] = :modmanage_delmod
    hooks[genmsg '!savemods'] = :modmanage_savemods

    return hooks
end
