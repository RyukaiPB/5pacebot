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
    listmods()
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
    hooks = Hash.new(0)

    hooks[genmsg '!addmod\s*'  ] = :modmanage_addmod
    hooks[genmsg '!mods\s*'    ] = :modmanage_listmods
    hooks[genmsg '!delmod\s*'  ] = :modmanage_delmod
    hooks[genmsg '!savemods\s*'] = :modmanage_savemods

    return hooks
end
