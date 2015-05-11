Writing Plugins
===============

Writing plugins is rather trivial. Each plugin should be self-contained. They can, however, use utility functions from `util/`.

The structure of your plugin file should be:
- Various callback functions. They should be called `[plugin name]_[function name]` and they must always take one argument. That argument will be the raw input line that matched the regex.
- There must also be a `gethooks` function that takes no arguements. This is your opportunity to register your callbacks.
    - This function must generate a hash. The key will be the regex which should match a raw input and the value should be the callback to call.
    - For example, if you have `hello_hi` as a function, and the trigger to activate is `!hi`, you would write `hooks[genmsg '!hi'] = :hello_hi`.
    - `genmsg` is a utility function, that generates a regex that matches a message to the channel that the bot is watching.
- Your plugin may install other files other than just `[plugin_name].rb`. A prime example is `[plugin_name].yaml`. If you need multiple files, or your plugin is complex, you should create a directory `[plugin_name]/`

For an example, look at `hello.rb`.
