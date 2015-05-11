# util to reload plugins/util

def reload_util(x)
    loadutil
end
def reload_plugins(x)
    loadplugins
end
def reload_core(x)
    loadcore
end
def reload_all(x)
    loadcore
    loadutil
    loadplugins
end

def gethooks()
    hooks = {}

    hooks[genmsg '!reload util'    ] = :reload_util
    hooks[genmsg '!reload plugins' ] = :reload_plugins
    hooks[genmsg '!reload all'     ] = :reload_all
    hooks[genmsg '!reload core'    ] = :reload_core

    hooks
end
