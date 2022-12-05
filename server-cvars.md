# IOQuake3 Server Cvar Tutorial and Reference

By BEan

In order to get a basic server IOQuake3 going, you will want to create a configure the settings you want via *cvars*, and start the server
with a *launch string*.

The settings, for any Quake-engine game, can either be entered in the to server's console, or stored in one or more configuration files
that will be automatically executed by the server. The engine stores these settings as variables, known as `cvar`s (e.g. *console
variables*) for short. These cvars work the same, no matter how they are entered into the server. 

'Launch string' is slang for the command use to start the server. It includes the server executable, followed by the server's starting
commands and cvars. In this launch string, you'll generally want to specific config files to execute, via the `+exec <server-whatever.cfg>`
command.

The goal of this guide is to document the most common cvars, by providing document examples along with a brief introduction to running a
IOQuake3 server.

## Launch String

Everything starts at the launch string, this is the command that you will put into the console of your system to launch the server.
To keep things simple, I will explain the part of the most basic example below and will exclude the docker parts that you will see mentioned
in this repository.

```shell
./path/ioq3ded.x86_64 +exec server-ffa.cfg +exec playlists.cfg +vstr stock-dm-1 +set rconpassword "EXAMPLE"
```

First thing that you will see is `"./path/ioq3ded.x86_64"`, simply put this is the location and executable file of the server.

The next part is `+exec server-ffa.cfg +exec playlists.cfg`, which loads the config file `server-ffa.cfg` followed by `playlists.cfg`.
Depending on the situation you can prepare different config files for different situations and game modes.

The server requires a map to be specified, otherwise it can't start. In our example we set a map via the playlist included in this repo, via
`+vstr stock-dm-1` (for playlist details see [README.md](./README.md)). Alternatively, you can specify a single map via `+map mapname`
(this shortcut will break the server's configured map playlists).

In order to protect remote access to your server a remote console "RCON" password needs to be set with +set rconpassword "EXAMPLE"
on the command-line because the server configs are viewable on github. This is the password you use on hlsw or other rcon software in order
to send commands to your server remotely.

If you are running a mod you may see a command like this `+set fs_game directory` in the string.

```shell
/app/ioq3ded.x86_64 +set fs_game osp +exec freezetag.cfg +exec playlists.cfg +vstr stock-dm-1
```

This tells the server to look in a different directory for the server content files. In this example, instead of looking in `baseq3` it will
access files in the `osp` folder for files to run that mod. Keep in mind the client would also need these files or at least be able to
download them.

If you need to run additional cvars after the configs on startup you can just add them to the end using "+ command".
Just look in to the sample configs for examples.

## Basics on server configs and examples

When it comes to editing and making server configs, you just need a basic text editor like notepad, nothing fancy, no special formatting.
Just remember if you need to comment or notes on something just type it after a "//" on the same line so the software doesn't try to process
it.

In the [baseq3](https://github.com/LacledesLAN/gamesvr-ioquake3/tree/main/dist/app/baseq3) folder of this repo
I have included some sample config files to get started with and to build off of and some to help with certain situations.

[autoexec.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/autoexec.cfg) - This file executes automatically
executes on startup no matter what. This file is good for variables that will be universal.
In the example you will see settings for connection speeds, fast download, server master listings, etc.

server-xxx.cfg - There are multiple files with this naming convention. The XXX stands for the game type that you want to run.
I have included examples for Capture the flag, deathmatch, team deathmatch, and 1v1 tournaments.

[server-VR-DM.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/server-VR-DM.cfg)- This is a basic config file
built for the [quake3quest](https://quake3quest.quakevr.com/) community. It is set so that your server will show up in the server browser
for the quest version of Quake3.

[lock-server.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/lock-server.cfg) and
[unlock-server.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/unlock-server.cfg)- Originally developed for a
Quake3quest tournament. running `exec lock-server` and `exec unlock-server.cfg` in the command-line allows for server to be locked up and
unlocked on command. It also provides a textbook example on how to set a server private.

[docker-tester.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/docker-tester.cfg)-
This file is used for testing purposes only. It just sends system information to the console.

## Essential Cvars

Now to real "bread and butter" of a server, let's examine a basic config file and to examine the pieces.

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

```text
set sv_privatePassword "hello"             // password to join the server SET THIS AT LAUNCH STRING
sv_privateClients 1                        // Enable server to be password protected.
set rconpassword "changeme"                // password for remote console.  SET THIS AT LAUNCH STRING
```

So `sv_privatePassword` and `sv_privateClients 1`  are the variables you would use to prevent players from entering private matches.
 Since this Docker repository contains a stock server, it is completely open. You can add these cvar settings to
the game upon launch by adding `+set sv_private password "secretword" sv_privateClients 1'`.

```text
set sv_maxclients 16                       // maximum number of players than can connect to the server
```

This allows you to set the max number of players that can connect.

```text
set g_inactivity 120                       // kick players after being inactive (in seconds)
```

If a player has been inactive after that many seconds they get kicked.

```text
set sv_pure 0                              // 0: Client side mods allowed 1: pure server, no altered pk3 files
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
| Harvester                | 7     | Requires Team Arena Expansion |

For Quake 3 arena the two game modes that would require their own playlists are `1` (Tournament) and `4` (Capture the Flag). The capture the
flag game mode just needs a CTF playlist. The tournament game mode is meant for 1v1 matches so having a play list of small maps would be
best.

```text
set sv_allowDownload 1              // enables downloading maps from server
set sv_wwwDownload 1                // enables the http redirect
set sv_dlURL "http://www.url-to-your.com/files/" // should point to the q3a folder
set sv_wwwDlDisconnected 1          // disconnects the client while downloading the files
set cl_wwwDownload 1                // connects the client again when the download is finished
```

If you have custom maps or any custom files, the client needs to be able to download them. To prevent a client downloading files from
interfering with function and performance with the server, its best to use a web server to host the files for download. The only variable
that needs to be changed is the sc_dlURL. This feature was not original part of Quake 3 arena and was added to ioQuake. A good explanation
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
The variable `g_spskill` determines the skill of the bot, 1 for easy and 5 for hard.

## Commands

Keep in mind this doesn't contain all commands. More can be found the
[ioquake3 sys-admin-guide](https://ioquake3.org/help/sys-admin-guide/).

| Command                                | Description                                                                                 |  EXAMPLE
| :------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------- |
| status                                 | Current server status information                                                           |                           |
| clientinfo                             | Display name, rate, number of snaps, player model, rail color, and handicap (state number?) |                           |
| clientkick                             | Kick a client by slot number                                                                |                           |
| banclient                              | Ban a client by slot number used in conjunction with `status` you can ban players by their slot number regardless of player name | banclient 4 |
| banUser                                | Ban a client by their player name.                                                          | `banUser jerk`            |
| banaddr                                | Ban an ip address range from joining a game on this server, valid `<range>` is either playernum or CIDR notation address range | banaddr 127.0.0.1
| bandel `<range>`                       | Delete ban (either range or ban number)| bandel 127.0.0.1                                   |                           |
| addbot `<name> <skill> <team> <delay>` | Adds a bot to the server. For [name] simply use the name of the model                       | `addbot doom 4 blue 10`   |
| killserver                             | Stop server and shutdown                                                                    |                           |
| kick (client number)                   | Kick a player from the server                                                               |                           |
| kickbots                               | kick all bots                                                                               |                           |
| kicknum `<client number>`              | kick a client by number, same as client kick command                                        |                           |
| game_restart <fs_game>                 | Switch to another mod                                                                       | game_restart osp          |
| map (mapname)                          | Change map (breaks playlist functionality)                                                  | map q3dm4                 |
| vstr varible name                      | Runs variable in [playlist](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/playlists.cfg) file to change map and keep playlist going | vstr demo-dm-3 |
| system info                            | Shows system info                                                                           |                           |
| echo "text"                            | Outputs "text" to console. Useful at the beginning of a config for logs                     | echo "running server-cfg" |

## Team Arena

ioQuake3 fully supports the team arena expansion. The Team Arena expansion adds new modes, weapons, maps, team power-ups and other content.
Simply treat it like a mod by adding `+set fs_game missionpack` to the command line.
Also you will have to provide the pak0.pk3 file and mount it if you are using docker.

-v ~/q3a-assets/missionpack/pak0.pk3:/app/missionpack/pak0.pk3

Every game mode that is available in stock Quake 3 is available in Team Arena only difference is the added content.

| Game Mode        | Description                                              |
| :--------------- | --------------------------------------------------------- |
| One Flag Capture |  Collect the flag in the middle of the map and return it to the enemy base without being killed. |
| Overload         | Objective is to destroy the other teams skull-adorned obelisk. The skull has a total of 2500 health and regenerates 1 health per second. |
| Harvester        | Objective is to collect skulls in the middle of the map that are generated when a member of the opposite team dies. Once skulls are collected you must take them to the enemy base to score. If you are killed you lose all skulls. |
