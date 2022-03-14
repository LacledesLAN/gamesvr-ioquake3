===================================================================
  	           Insta-Unlagged Version 1.1
         
	by Aaron Storck (Paradox) and Neil Toronto (Haste)
	    http://www.digitaldelay.net/InstaUnlagged/
===================================================================

Technology: Unlagged is the proof of a simple concept developed by
Neil Toronto in order to allow HPB's to have a chance against all
the evil LPBs that roam the world of quake 3. In normal quake3 the
server only stores each players current position, however, in 
Unlagged the server stores your past positions and can look up to 
a half a second back in time. Every time a player makes a shot with
an instant-hit weapon (machinegun, shotgun, railgun, lightning) 
the server calculates where the player has been in order to find 
where the player should of been if it wasn't for latency (lag).

The only thing that you must understand is that Unlagged will not
reduce your ping or recover lost packets; It simply compensates for 
them. Because of this, when on an Unlagged server remember to always
shoot directly at your opponents; do not lead; just play like you
were playing a single-player game.

The technology can only do so much however, and once players pings
start reaching heights of 350 and above, the player is basically 
out of luck. 

Insta-Unlagged: Insta unlagged is the obvious next step of the 
Unlagged model. Not only is it proof that this simple concept works; 
it is every 56ker's dream. It has all the features of Instagib+ plus
it has many other features.

Current Features List:

 - Ability to change insta_weapon to any of the quake 3 weapons.
 - Custom countdown for weapon change.
 - Ability to change the cycle (Rate of Fire) of most quake 3 weapons.
 - Ability to change the spread of the machine gun and shotgun.
 - Ability to turn on/off falling damage.
 - Ability to turn on/off self damage.
 - Ability to control the amount of splash damage dealt by projectile 
   shooting weapons.
 - Ability to control knockback dealt by projectile weapons on self and
   seperately on the opponent.
 - Ability to control whether knockback to self is static or based off
   the distance you are from impact.
 - Ability to control the length of time that protection is provided on
   respawn (0 for no protection)
 - Ability to control whether players can fire while under protection.
 - Ability to control whether a warning is displayed to inform players
   that you cannot fire with protection if insta_protectionfire is set 	
   to 0.
 - Ability to control the amount of time players are forced to wait 
   before they respawn.
 - Ability to control whether the server plays a HolyShit sound effect
   when players make kick-ass frags.
 - Ability to control whether players can use the /ready command to
   start a match before the warmup is finished.
 - Ability to take advantage of the new ClanBattle technonlogy, which
   has its own long list of features, check the website.
 - Three new gametypes: rounds, ClanBattle, and Team Survivor.
 - Ability to control whether players have to carry their flag back
   to their base to return their own flag instead of just touching it.
 - Ability to turn on or off rail jumping.
 - Ability to mute spectators during team games. Spectators can still
   talk with other spectators.
 - Ability to have map rotations with clanBattle games.
 - And the ability to control whether people can callvote on insta 
   variables seperately from regular quake3 callvoting variables 
   (map and whatnot).


Fixes in 1.1 Release:

 - Fixed fraglimit, timelimit, capturelimit multiplier bugs.
 - Fixed problem with knockback to others (opponent and same team)
 - Fixed an issue with the /ready command
 - Stopped some debug information from printing in listen server
 - Allowed the use of map rotations in ClanBattle games.
 - Fixed ID map rotation bug.
 - Fixed ID /reconnect bug
 - Fixed major ID bug concering a g_warmup setting less than 2 in
   tournament games.

Due to the fix of the ID map rotation bug, it is necessary that
the map rotations start with d1; that is, if you would like the
map rotation bug to be fixed. Check any of the included cfg
files for examples.

To read about the fixed ID bugs, you can check out my post on the
q3w forums:
http://www.quake3world.com/ubb/Forum4/HTML/006017.html

Double-Click the Variable List internet shortcut for a list of the 
variables that can be modified, what they can be modified to, and
what they do.

Check the Insta-Unlagged Website for new updates or to make
suggestions or comments: http://www.digitaldelay.net/InstaUnlagged/

I would just like to say thank you to G-Man for helping me beta test
and putting up with me through the process of creating InstaUnlagged.
He has been a great help and InstaUnlagged would not be what it is
without him. I'd also like to thank the members of the clan HPO for
helping beta test and Roger R. from planetquake3.net for mirroring
all the InstaUnlagged releases. Finally, I'd like to thank Neil
Toronto (haste) for providing me with the unlagged code.    

====================================================================
	      CFG Arena - by Aaron Storck (Paradox)
====================================================================

Look for this one to come out in a couple of weeks. It is
the ultimate server-side configurable mod. Over 200 variables to
modify; from speed of projectiles, rate of fire (cycle), which
weapons and how much ammo you start with to item placement on the map
which items spawn onto the map, how long it takes for them to
respawn, and much much more. And there are many added features
which include (but are not limited to): Homing rockets, proximity 
mines, vortex grenades, detonatables, cluster grenades, alternate fire,
accelerating rockets, client weapon weight control, and grapple hook.

You may be asking yourself, why is information about CFG Arena in this
readme? Its simple, CFG Arena also features Unlagged technology. And
like any other variable of CFG Arena it can be turned on or off in
real-time or by premade configuration files. You dont have to make
your configuration files by hand either. You can use an external
or internal CFG editor that comes along with the mod. Configurations
can also be assigned to maps, simply by adding the map name in the
cfg's name (eg: q3dm17configuration1.cfg).

Simply put, The possibilities are Endless!