OSP Tourney DM/CA/CTF for Quake3
================================
Version: 1.01
Date:    18 Dec 01
Site:    http://www.OrangeSmoothie.org
Contact: rhea@OrangeSmoothie.org

--------
Credits:
--------
Lead Design/Programming:
	Jason "Rhea" Keimig (rhea@OrangeSmoothie.org)

Additional programming:
	Kevin "arQon" Blenkinsopp (arqon@promode.org)
	Sander "Dessignator" Brandenburg (dessignator@OrangeSmoothie.org)
	Harvey "]R[Papa" Morris (papa@reactivesoftware.com)
	Jens "Khaile" Bergensten (khaile@www.com)
	Michael "PhaNToM" Billing (phantom@promode.org)
	rest of the CPM staff

Mappack design and all things map-related for 1.0 release:
	Christian "SHoD" Farcy (shod@noos.fr)

Map Designers:
	Christian "SHoD" Farcy - ospdm1/2/3 - (shod@noos.fr)
	Nicolas "Nunuk" Bouvier - ospdm2 - (nunuk@planetquake.com)
	Benoit "Bal" Stordeur - ospdm3 - (Bal@planetquake.com)
	Todd "Mr.CleaN" Rose - ospdm4 - (mrclean@planetquake.com)
	Scotty "Teddy" Drader - ospdm5 - (sdrader@home.com)
	Ágúst "DruZli" Atlason - ospdm6 - (drusla@simnet.is)
	Jerry "clem" Dent - ospdm7 - (jed@verio.net)
	German "JaLisK0" Garcia - ospdm8 - (JaLisk0@terra.es)
	"Charon" - ospdm9 - (charon@atlantacon.org)
	Paul "Polo" de Rosanbo - ospdm10 - (polo2ro@fragdome.com)
	Roeland "Geit" Scheepens - ospdm11 - (ouwegeit@goat.gamepoint.net)
	Jeremy "random" Eaton - ospdm12 - (jeremy.eaton@telus.net)
	David "SgtGhost" Levesque - ospca1 - (sgtghost@hotmail.com)
	Rich "Publius" Tollerton - ospctf1 - (rtollert@tranquility.net)
	Daniel "Drunken Boxer" Lanicek - ospctf2 - (dlanicek@yahoo.com)

VoodooStats:
	"myrddin" (myrdd1n@hotmail.com)

OSP Server Configuration Tool:
	Greg "phred" Price (greg@price.org)

Build installer:
	Tim "Gouki" Pearson (gouki@clanavl.com)

OSP Website:
	"myrddin" (myrdd1n@hotmail.com)
	Tim "Gouki" Pearson (gouki@clanavl.com)



*** This version of OSP supports Quake3 version 1.30
*** and higher only!

For a bit of background, OSP Tourney DM is designed to
facilitate competitive, yet flexible, match play.  This
mod simply makes it easier and more convenient for players
and admins alike to ehance the Quake3 experience.  There
have absolutely been *NO* changes to the core gameplay
or its dynamics -- its all default Quake3 in this regard.

The latest version of OSP (versions 0.99c and up) now have
Challenge Pro Mode (http://www.challenge-world.com/promode/)
capabilities built in!  CPM is a careful change to several
fundamental aspects of Q3 that facilitate faster gameplay
for both players and spectators alike.  Check it out!  Its
loads of fun and adds a lot of spice to "vanilla" Quake3.
(For a complete list of changes, check out the CPM-changes.txt
file found in the Docs/ directory).


============
Quick start:
============
Install/Unzip the osp-quake3-<version>.exe/zip in the root Quake3/
directory, with folders enabled.  You should have a newly
created directory named "osp" with all of the files listed
in enclosed the INSTALL.txt file.

To start up a DEDICATED OSP server, just type:
----------------------------------------------
** DELETE the zz-osp-server0.pk3 from your osp directory. **

(Light servers)
quake3 +set dedicated 2 +set bot_enable 0 +set fs_game osp +exec <cfg-name>.cfg

(Heavy servers)
quake3 +set dedicated 2 +set bot_enable 0 +set fs_game osp +exec <cfg-name>.cfg

----> IF UPGRADING FROM A PREVIOUS VERSION OF OSP:
      Delete ALL z-osp-cgameXXX/extra/players.pk3 files in your server's
      osp/ directory.  Dedicated servers should only have 
      zz-osp-pakXXX.pk3 files in its osp/ directory to prevent
      unnecessary .pk3 downloads and confusion (especially on
      Linux/BSD-based servers).


To start up a LISTEN OSP server (where a client and server
run in the same machine), type:
----------------------------------------------------------
quake3 +set fs_game osp +set bot_enable 1 +exec <cfg-name>.cfg


**
** LINUX/BSD admins: Replace "quake3" with "q3ded" in the above examples.
**                   Make sure to add:
**                        +set fs_basepath <dir> +set fs_cdpath <dir>
**                   that points to your root Quake3 directory to
**                   properly enable server downloads.  Also, add a
**                        +set vm_game 2
**                   to the command-line to ensure full compatibility.
**



=======
Details
=======
There have been MANY features added to the default Quake3 game:
- Enhanced match mode play, utilizing player "ready-up" to
  force synchronized matches (all modes of play).
- Extra mode of play: "Clan Arena" that is similar in many
  respects to the popular RocketArena mod for Quake.
- "Challenge Pro Mode" (CPM) play settings to allow for faster
  gameplay.  This set of features is available under all game types.
- Highly configurable client-side modification that allow for HUD
  manipulation, enhanced client authentication, auto-demo/screenshot
  recording, etc.
- 15 new maps for all modes of play.
- Voodoo stats server/client log parser
- OSP server configuration tool
- Multi-view spectating.  OSP allows spectators to view multiple
  player screens AT THE SAME TIME!  Sounds included =)
- Additional spectator mode: The ViewCam.  This mode allows for
  viewing the game in a more cinematic manner to get a better feel
  for the action.
- Extensive in-game player and match statistics that are unique to
  each mode of play (FFA, 1v1, Team DM, CTF, and ClanArena).
- Server-side definable "decals" that can be placed throughout the
  level, on a per-map basis.  Up to 16 custom graphics and 32 total
  decals can be placed on every map.
- Many enhancements from the excellent Q3Comp mod.
- Optional "Coach" spectators that can talk with members on the team,
  issue commands on their behalf, and view all team members for
  a truly coach-style type of match play.
- Flexible "filtering" mechanism to allow admins to deny player
  access based on name, IP address, or password.  Also allows for
  player "reservations" (name/address/password) as well.
- Highly advanced and configurable voting system.
- Robust dynamic maplist generation system coupled with map rotation
  capabilities that takes into account player counts and allows for
  changing any server setting when the new map is loaded.
- Player stats window for quick viewing of a player's performance.
- "Config mode" voting, where players can vote in new server
  modes that are supported by their own server configs.
- Remote admin capabilities with many commands available.
- Team captain capabilities to manage a team and its players.
- Color skin support for head, body and legs.  All three can be
  different!  10 colors available for each section.
- Ability for teams to "lock out" spectators to prevent giving
  away strategy and cheating posibilities with Internet voice
  communication mechanisms.
- Ability to follow only the red or blue team.
- Automatic server public variables that are updated based on
  gameplay.  Current match information such as time remaining,
  team scores (if available), etc. can be seen in the server
  information box from utilities such as GameSpy when the server
  is "refreshed".
- Highly flexible overtime mode capabilities.
- Server "timeouts" for match play that allow for a pause in
  the action (called by either team captians or referees).
- Highly configurable (optional) grappling hook available.
- Complete item/powerup banning capabilies (map independent).
- Item replacement capabilities (map independent).
- Additional "skunk" mode setting for 1v1 matches.  This setting
  allows for a decent remake of RocketArena 1v1 matchplay.
- In-server fix for q3tourney3 for team-based games.
- Customizable server-specific MOTD support displayed to clients.
- Customizable server-specific graphics to display to clients.
- Optional item dropping for TDM/CTF.
- Optional Q2 armor system.
- Client-configurable lightning gun setting to give a better
  "feel" of its use under laggy conditions.
- Ability to give weapons/ammo to players upon each respawn.
- Ability to specify starting weapon for a player.
- Additional informative logging.
- Many bug fixes to the default id game.
- Russian/Spanish/Chinese document translations.


======================
Additional information
======================
1. Check the Docs/ directory for complete mod update information
   (osp-q3-History.txt) and all new server variables referenced and
   described in excruciating detail (osp-q3-Variables.txt).
   Available commands are found in osp-q3-Commands.txt.  Client
   settings can be found in osp-q3-ClientReadme.txt.

2. Example server configurations have been provided to ease
   system administration in putting together the "correct"
   config.  Simply take one of the included configs that more
   closely matches how you want your server to run, and modify
   it as needed.

3. For a list of all client commands, type:

	\help

   After connecting to an OSP server.

4. For a list of all referee (remote admin) commands, type:

	\ref
or	\r_help

   After obtaining referee status.

5. For a list of all "callvote" voting commands available,
   simply type:

	\callvote ?

  By itself to get a listing of all currently available
  voting options.

6. Further, to find current server/vote settings, vote usage
   and command description, type:

	\callvote <option_name> ?

   The server will describe the voting format for this <option_name>,
   a description of what it controls, and its current setting (if
   applicable). For example (to see current the server's Quad Damage
   powerup setting), type:

	\callvote quad ?

   Will give:

	Usage: \callvote quad <0|1>
        Enables/disables Quad Damage powerup availability

      Quad Damage is currently ENABLED

   Simple, eh? =)


==========
Other Junk
==========
Big thanks go out to a|citizen and a|wiseguy (and the whole abuse
clan for that matter) for helping me get everything "just right".
Check us out at: http://www.teamabuse.com/

Huge thanks to Khaile, Hoony, and the entire CPM crew for providing
the source and info to help integrate CPM functionality in OSP.
Check out the official implementation of CPM (Challenge ProMode) at
http://www.promode.org

Also gotta give high-fives to a lot of other people who helped
push OSP in the right direction: Godsmurf, Talita, FiTH-arcane,
TrEEcH, Gouki, Olzah, and Smegma.  There are just too many!
Sorry if I forgot anyone!

And to tubesock/Gouki.. guys, thanks a bunch for testing, debugging and
nit-picking features to perfection.  Very much appreciate all the help
you both have provided.

Thanks to ]R[Papa (of q3comp fame: http://www.reactivesoftware.com)
and Strider for the collaboration on the id event/sound problems.

"THANKS MANG!" goes to arQon of (soon to be released) CPMA fame.
Thanks for all of the help on code snippets in the twilight years of
the 0.99x series of OSP ;-)

More deep bows to Strider (Alan Kivlin - akivlin@lineone.net) for the
client 125Hz sampling patch and a couple of pointers on some of the
multi-view spectating (like a cool CTF flag view that I haven't enabled
yet).

Indebted to Jim Luther (dv8|Fia) and [AVL]Hifi in helping me track
down all of OSP's problems with the beloved Macintosh.  Those pesky
Macs.... ;-)

Props to Heeler for some of the spif targa graphics help.  Adobe rocks!

Much love to "alias" of team evolution (http://evolution.clanpages.com)
for the spectator config to sort out some of the new features of the
multi-view spectating option under OSP.

Thanks to these viewcam arteests:
      SHoD        - ospdm1-11
      [AVL]Gouki  - q3ctf3, q3ctf4, q3wctf1-3, japanctf
      jab         - q3ctf1, q3ctf2
      Olzah       - ztn3dm1
      Rune        - q3tourney2
      SoloRail    - q3dm1-4, q3dm8-12
      TrEEcH      - q3dm13, q3dm17, q3jdm8a
      VK-Hunter   - q3dm14-16,19 q3tourney1,3,5, overkill

For questions, comments, bugs, or feature-requests, send
all correspondence to:

      rhea@OrangeSmoothie.org

Check our site for the latest OSP-Q3 updates at:

      http://www.OrangeSmoothie.org/beta.html

Also, check out our web forum at:

      http://www.OrangeSmoothie.org/forum/

Finally, we also have an IRC channel, #osp, on EnterTheGame
(irc.enterthegame.com:6667).  Check http://www.enterthegame.com
for info on this relatively new set of IRC servers.

Thanks for playing OSP,
-Rhea