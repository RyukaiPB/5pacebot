# util to reload plugins/util

def reload_util(x)
    loadutil
end
def reload_plugins(x)
    loadplugins
end

def gethooks()
    hooks = Hash.new(0)

    hooks[genmsg '!reutil'    ] = :reload_util
    hooks[genmsg '!replugins' ] = :reload_plugins

    hooks
end
