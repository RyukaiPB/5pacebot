# Retrieves a list of mods
# Stores it
# Provides "ismod" utility function
# Since the twitch irc API is outdated (e.g. WHO command no longer supported), mods are stored in mods.yaml

# load on startup

require 'yaml'

@mods ||= YAML.load_file("mods.yaml")

def ismod(user)
    return @mods.include? user
end

def listmods()
    msg @mods
end

def addmod(user)
    @mods << user
end

def delmod(user)
    @mods.delete user
end

def savemods()
    puts "Saving: #{YAML.dump(@mods)}"
    IO.write("mods.yaml", YAML.dump(@mods))
end
