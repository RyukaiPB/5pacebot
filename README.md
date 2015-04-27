Space Bot
=========

A simple bot for twitch.tv
--------------------------

While technically could be made to be a regular irc bot, I made this as my personal stream management bot for twitch.

This was an exercise in making a simple irc bot with a lot of potential functionality.

### Quick Startup Guide ###
1. Make sure you have the prerequisites, listed here:
    - git
    - Ruby 2.0 or higher
    - libyaml
    - a *nix like environment (you could possibly go without that, but I don't support windows directly, outside of cygwin and the like)
2. Clone this repository locally.
3. Edit `bot.yaml` according to the comments in there.
4. Edit `mods.yaml` to include your name.
5. Run `bot.rb` inside of `5pacebot/`

You should also consider examining the `plugins/` directory, to see what kind of commands are available by default, and the general syntax to adding new ones.

### Inner Workings ###

Here is a simple overview of how the bot works:

1. The bot parses bot.yaml to get the connection information.
2. The bot will load everything in `util/*.rb`. Those files contain utility functions that are to be available to plugins. They are to only include bot specific things, the closest it gets to plugin-land is the mod functions.
3. The bot will then load everything in `plugins/*.rb`. For each file loaded, it will call `gethooks()` which returns a hash. The key of the hash is a regex that determines when the command is to be triggered. The value of the hash contains a symbol to the function which is to be called when that command is triggered. The bot adds all of these entries to the hooks Hash.
4. Every time a message arrives, the bot iterates over all the hooks' keys, and if any of them match, calls the associated function.

Reloading both `util/*.rb` and `plugins/*.rb` is thus trivial. The functionality of the bot is rather simple, making it less prone for difficult errors and easier to modify for specific needs.
