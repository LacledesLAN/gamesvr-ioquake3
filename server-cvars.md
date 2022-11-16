# IOQuake3 Server Cvar Tutorial and Reference

By BEan

In order to get a basic server going and setup you will need to setup a server config file with the settings you want. The settings for any
quake engine game are stored in console, variables or `cvar`s for short. In all the example config files the cvars and functions are
labeled, but I figured its best to go over a few.  All config files are just scripts that just commands that run in the console. So pretty
much every cvar and console command are interchangeable. Also you can have multiple configs on your server for any reason, just add
`+exec server-whatever.cfg` to your command string.

## Essential Cvars

To start off, let's examine a basic config file and to examine the pieces.

```text
set sv_hostname "MY QUAKE3 SERVER"         // name that appears in the server list
```

The hostname is what you name the server its what will be listed on server browsers and favorites list. Most of the time it should say who
owns it and what kind of server it runs. A good example would be "Pierre's Q3 CTF server"

```text
set g_motd "CHANGE ME"                     // message that appears when connecting
```

The MOTD, or 'Message Of The Day', is a text message that shows up on startup. Typically it is used to show server rules or other helpful
information.

set sv_privatePassword "hello"             // password to join the server
set rconpassword "changeme"                // password for remote console. For Docker it is best to put this in your launch string

So `sv_privatePassword` is the password you would use to prevent players from entering private matches. `sv_rconpassword` is the password to
allow remote admin access. Since this Docker repository contains a stock server, it is completely open. You can add these cvar settings to
the game upon launch by adding `+set sv_private password "secretword" +set rconpassword "adminpassword"`.

```text
set sv_maxclients 16                       // maximum number of players than can connect to the server
```

This allows you to set the max number of players that can connect.

```text
set g_inactivity 120                       // kick players after being inactive (in seconds)
```

If a player has been inactive after that many seconds they get kicked.

```text
set sv_pure 0                              // 1: pure server, no altered pk3 files
```

So players may have client side mods to change the look and appearance Quake 3. Some mods are to enhance the visual quality and other mods
may be made to cheat and see through walls. You would want to set this variable to 1 for a competitive match.

```text
set g_allowvote 1                          // allow players to vote for map changes
```

This will allow players to change maps and other game modes without admin intervention.

```text
set g_log server.log                       // log file name
set logfile 0                              // 0:off 1:buffered 2:continuous 3:append to existing
```

It's a good practice to always log what happens in your server to a text file that can be looked at later. The `g_log variable` cvar
contains the file name of the log and `logfile` determines what is recorded.

## Rules and Game Modes

```text
set timelimit 10                           // time limit in minutes for all modes (0 for no limit)
set fraglimit 30                           // frag limit for all modes (0 for no limit)
set capturelimit 8                         // capture limit for CTF mode (0 for no limit)
```

A game server can be said that its an arena for the players and the referee. These variables emphasize the "referee" aspect. These variable
set limits for time on the map, score for frags, and flag captures.

```text
set g_teamAutoJoin 0                // 0:goes into spectator mode, 1:auto joins a team
set g_teamForceBalance 1            // 0:free selection, 1:forces player to join weak team
```

So when a player joins a server the payer could automatically be thrown in or join as a spectator with the options join the game and/or pick
a team team (in team games). Setting `g_teamAutoJoin` to 0 will allow the players to choose what side to join. The variable
`g_teamForceBalance would` force even teams and will not allow anyone to join a team if it would be lopsided.

```text
set g_gametype 0                           // sets the game type
```

The gametype variable is an important variable that determines what gametype is played.

| Game Mode                 | Value | Notes                         |
| :------------------------ | :---- | :---------------------------- |
| Free for All (Deathmatch) | 0     |                               |
| Tournament                | 1     |                               |
| Team Deathmatch           | 3     |                               |
| Capture the Flag          | 4     |                               |
| Free for All (Deathmatch) | 2     | Requires Team Arena Expansion |
| One Flag Capture          | 5     | Requires Team Arena Expansion |
| Overload                  | 6     | Requires Team Arena Expansion |
| ?Harvester                | 7     | Requires Team Arena Expansion |

For Quake 3 arena the two game modes that would require their own playlists are `1` (Tournament) and `4` (Capture the Flag). The capture the
flag game mode just needs a CTF playlist. The tournament game mode is meant for 1v1 matches so having a play list of small maps would be
best.

```text
set sv_allowDownload 1              // enables downloading maps from server
set sv_wwwDownload 1                // enables the http redirect
set sv_dlURL "http://www.url-to-your-files.com" // should point to the q3a folder
set sv_wwwDlDisconnected 1          // disconnects the client while downloading the files
set cl_wwwDownload 1                // connects the client again when the download is finished
```

If you have custom maps or any custom files, the client needs to be able to download them. To prevent a client downloading files from
interfering with function and performance with the server, its best to use a web server to host the files for download. The only variable
that needs to be changed is the sc_dlURL. This feature was not original part of quake 3 arena and was added to ioquake. A good explanation
of this feature can be found in the [openarena wiki](https://openarena.fandom.com/wiki/Manual/Automatic_downloading).

## Bot Cvars

```text
set bot_enable 0                    // allow bots on the server
set bot_nochat 1                    // 1: disable bot chatting (recommended!)
set g_spskill 4                     // default skill of bots [1-5]
set bot_minplayers 5                // fills the server with bots to satisfy the minimum
```

Most situations would not require bots and bots have been used too often to make a server feel more populated than it is. For testing
purposes these commands are valuable to ensure functionality.

## Commands

| Command                              | Description                                               |
| :----------------------------------- | --------------------------------------------------------- |
| addbot [name] [skill] [team] [delay] | Adds a bot to the server. For [name] simply use the name of the model Example: `addbot doom 4 blue 10` |
| killserver                           | Stop server and shutdown                                  |
| kick                                 | Kick a player from the server                             |
| status                               | Current server status                                     |
| system info                          | Shows system info                                         |
| echo "text                           | Outputs "text" to console. Useful at the beginning of a config for logs. echo "running server-example.cfg" to let you know when the config is loaded |
