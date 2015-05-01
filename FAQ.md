FAQ
===

The Guide to All Things Nontrivial
---------------------------------

**Why 5pacebot?**

Because my stream is `5pacetoast`.

**Is changing stream game/title a planned feature?**

It was initially. However, after reading in to how Twitch.TV handles OAuth it no longer is. They appear to have an illusion that every project is going to be centralized (for example, nightbot). Under that assumption, they make it necessary to have a running web _server_ in order to generate tokens. They also require a client secret and a client id, one of which is like a "password that only you, the developer, should know". This makes staying decentalized, as is the scope of this project, rather difficult. I have no intentions of writing a web server for what is essentially a simplified and glorified IRC bot, nor do I have the intention to expect every user to create a temporary web server to unlock some functionality that shouldn't be hidden away this far in. In short, Twitch.TV has made some design choices in relation to the OAuth API that makes these kind of features outside of the scope of the project.

**Is [insert features that requires an OAuth API token] planned?**

See above.

**How about timers?**

Those _are_ a planned feature, and should be done soon-ish. I already know how it's going to be implemented, I just want to do some cleaning first.
