OSP Tourney DM/CA/CTF for Quake3
================================
Date:    28 Feb 03
Site:    http://www.OrangeSmoothie.org
Contact: rhea@OrangeSmoothie.org
Version: 1.03

This readme explains the enhanced client-side support and options
under OSP Tourney DM/CA/CTF.



Connect/graphics problems:
==========================
Try setting com_hunkmegs to 56 or 64 in your q3config.cfg (look for
its current setting already in the .cfg file), autoexec.cfg or what-
ever client config you exec on client launch.  You can even specify
this on the command-line with: +set com_hunkmegs 56.



Naming conventions:
===================
cg_* - General client-side options.
ch_* - Stuff related to client HUD settings.
cf_* - Stuff for client font (size) settings.



Message Control characters:
===========================
The following control characters describe additional features that can
be utilized for such things as the team chat console, names in the OSP
HUD and MOTD messages.

^B and ^b - make text blink
^F        - makes the text display only at the first half of a second
^f        - makes the text display only at the last half of a second
^N        - resets control stuff like ^B, ^F, ^f
^Xrrggbb  - allows the user to define the color using the rgb values (hex)

            (e.g. ^XFF0000 is red, ^X777777 some kind of grey).



Setting restrictions
====================
The following settings are enforced for internet play:

      r_lodcurveerror must be set to 250
	r_fullbright must be set to 0
      r_subdivisions must be no greater than 80
      r_znear must be set to 4
      r_shownormals must be set to 0
      r_showtris must be set to 0

If you have settings that violate any of these rules, OSP will reset the
faulty variable to an acceptable setting and issue a vid_restart.  A side-
effect of this will mean that maps may appear to load more than once
upon connecting to a server.

Other clamps:

	cg_bobup clamped to +/- 0.005
	upper bound of cg_fov clamped to 140
	upper bound of cg_zoomFov clamped to 140
	cg_shadows clamped to between 0 and 1
	no cg_thirdperson view if in the game (and on a dedicated server)
	com_maxfps must be between 1 and 125 (not bound for listen server)
		---> Can be disabled with a callvote of capfps 0


Available chat tokens
=====================
#A - Armor
	Current armor value (lower-case "a" will print the value
	with color coding, depending on the level of the value)

#C - Corpse
	The location where you last died
	/say_team "Overrun at #C"

#D - Damaged by
	The last player to score a hit on you
	/say_team "#D is here and he's heavily armed!"

#F - nearest Friend
	Reports closest teammate in team-based gametypes.

#H - Health
	Current health value (lower-case "h" will print the value
	with color coding, depending on the level of the value)
	/say_team "Hurting bad - #H/#A"

#I - Item (nearest available)
	Shows the nearest "significant" (weapon, armor, powerup, or MH)
	available item, and that includes dropped items.  Note, you must
      be able to *see* the center of the item (not just an edge).. this
      requires you to be facing in the general direction of the object.
	/say_team "#I available here"

#K - ammopacK (nearest available)
	Just like #I, except it reports only closest available ammopack.

#L - Location
	Many maps have terrible target_location entities
	e.g. PG on PRO-DM6 shows as YA
	"(pF.arQon) (YA): Weapon available" is a bit crap, neh?
	This shows the nearest "significant" item spawn
	(weapon, armor, powerup, or MH), whether the item is there or not

#M - aMmo wanted
	Lists all types of ammo for weapons you have that are empty or
	are nearly emptry (between 0 and 5 ammo).
	/say_team "Need #M"

#P - last item Picked up
	Reports last item picked up.  Useful for reporting when you pick
	up an important item (i.e. quad).

#R - health/aRmor (nearest available)
	Just like #I, except it reports only closest available health/armor.

#T - Target
	The last player you hit
	/say_team "#T is weak - finish him!"

#U - powerUps
	Lists all powerups you currently possess

#W - current Weapon held
      Prints the abbreviated name of the weapon you are currently holding


Client commands
===============
addstr [target_string] [source_string]
      Appends [source_string] to [target_string] (promode only)

currenttime
	Displays current local time.

menu
	Allows for adjustment of the various OSP-enhanced variables
	and options.  Below is a decription of supporting commands to
	utilize this client game option (note: words between ""'s are
	actually console commands):
		- "menu" enables the menu
		- "weapprev" and "weapnext" to scroll up and down though the
		   menu (bound to '[' and ']' respectively, by default).
		- "menuleft" and "menuright" to select menu items, or to make
		   values for some menu options decrease or increase.

		It is suggested that you bind these menu commands (i.e.
		weapprev, weapnext, menuleft, menuright and menu) to some
		out-of-the-way keys:
			bind / menu
			bind [ weapprev
			bind ] weapnnext
			bind ";" menuleft
			bind ' menuright

modif[1..5] stuff
        +modif[1..5] and -modif[1..5] supports the option for people who
	want to double-bind multiple keys using key sequences, as shown
	in the example below: 

	  set normkeys "bind 1 weapon 1; bind 2 weapon 2"
	  set altkeys  "bind 1 say_team nme incoming; bind 2 say_team base is safe"
	  +modif1 vstr normkeys
	  -modif1 vstr altkeys
	  bind shift +modif1
	
      Now when pressing the SHIFT key, +modif1 wil be executed.  When
	it is released, the vstr bound to -modif1 will be executed.  In this
	example, pressing shift will bind the 1 and 2 keys to weapons 1 and 2.
	When SHIFT is released, the 1 and 2 keys will be bound to
	"say_team nme incoming!" and "say_team base is under attack!".

	As a usage scenario from the above example, tapping the SHIFT key and
	then hitting the 1 key will result in issuing a "say_team nme incoming!".
	Pressing and HOLDING the SHIFT key while tapping the 1 key will switch
	to weapon 1.

        use \+modif1 ? to check what's bound to +modif1

      Note: This command requires initialization AFTER the cgame is loaded.  You
            simply cannot set your modif settings in a config file and expect them
            to automatically work (they are cgame commands).  However, you CAN use
            the "cg_execVstr" cvar to do an auto-init on OSP 1.01 servers and higher.

serverversion
      Displays current OSP version and all referenced .pk3s used by the server.
      Very helpful for determing what OSP version and .pk3 files used in a demo
      (the command can be used at any time while a demo is running).

+/-actions
      This is the Q3comp version of the same thing.

        set action1up "bind 1 weapon 1; bind 2 weapon 2"
        set action1down "bind 1 say_team nme incoming!; bind 2 say_team base is safe"
        bind shift +action1

      This will do the same thing as the modif example.
      You can have up to 10 actions. (0-9)

+fire [weap_1] [weap_2] ...
      Specifies a chain of weapons to attempt to switch to and fire, e.g.:

         +fire 5 3

      Switches to and fires the RL, if available, else it switches to the
      SG and fires, else no action is performed (promode only).

select [weap_1] [weap_2] ...
      Just like +fire, except the weapon is NOT fired.

+vstr [down_command] [upcommand]
      Another useful way to create weapon switching scripts.  Here's an example:

         set shaft "weapon 6; wait 2; +attack"
         set unfire "-attack"
         bind mouse2 +vstr shaft unfire



General Game Options:
=====================
General in-game client-side options to tweak fall under the cg_* category.
For most of the HUD (heads-up-display) options, see the ch_* and cf_*
options, listed in the next sections.


cg_altGrenades <0|1> (default = 0 - baseq3 grenade skin)
      Utilizes an alternate (prettier) skin/model for the grenades
      from the grenade launcher.

cg_altLightning <0|1> (default = 0 - new 1.29/promode skin)
      Utilizes the original skin (pre 1.29) for the shaft of the
      lightning gun.

cg_altPlasma <0|1> (default = 0 - baseq3 plasma skin)
      Utilizes an alternate (prettier) skin for the plasma bolts
      of the plasma gun.

cg_ammoCheck <0|1> (default = 0 - disabled)
      Disables the ability to switch to a weapon that doesn't
      have any ammo.  Useful for multiple-weapon binds.

cg_autoAction <option_bitmask> (default = 0)
      Automatically performs actions at certain points in the game.

       <option_bitmask>:
             1 - Automatically save stats to a local text
                 file at the end of a match. Logs will be
                 stored in:

                   <osp_root>/stats/<date>/<logname>.txt

             2 - Automatically takes an end-level screenshot
             4 - Automatically records a match (requires
                 a full warmup server - g_warmup = 0)
             8 - Dump your team's weapon stats
            16 - Dump all players' weapon stats

cg_clientLog <value> (default = 0)
      Enables client-side logging option.  A non-zero value of "X"
      (where "X" is 1 or higher) enables logging all of messages issued
      during gameplay.  Colors are stripped and time-stamps are included!
      All entries are appended to osp/client_logs/clientX.txt text file.

cg_Customloc <0|1> (Default = 0 - disabled)
      Use custom location information (from files in the locs/<mapname>.cfg
      directory) for the teamoverlay and teamchat locations.  To add
      locations for a map, move to a particular location, and then issue:

            \addpos <location name>

      You can use all kinds of color and special characters in the
      location_name field. These position markers will be added to
      locs\<mapname>.cfg everytime a location is added.  These locations
      are loaded when a map is loaded or the client issues a vid_restart
      command.  If a customloc file is not found for the current map,
      the location information that is displayed will be from the map's
      default information.

cg_drawCrosshairNames <0|1|2> (default = 1 - show all players)
      0 - No drawing of player names when pointing at them.
      1 - Display the name of any player who is in the crosshair.
      2 - Display only teammate names.

cg_drawDecals <0|1> (default = 1 - Decal drawing enabled)
      Enables/disables drawing of in-game decals.

cg_drawPing <0|1|2> (default = 1 - show current ping)
      Enables/disables the display of your current ping on the HUD
	(above lagometer).  Option 2 will color the value with the
      corresponding color-code as seen in the scoreboard

cg_enableOSPHUD <0|1> (default = 1 - OSP-based HUD enabled)
      Enables the OSP-based HUD.

cg_enemyColors <HSL> (default = 0000 (White))
      Specifies the various color options for your enemies, if using
      the "pm" skins for the default Q3 models:
          R = rail color (for cg_teamrails 2)
          H = head/helmet color
          S = shirt color
          L = legs color

----> Note: Values of the "char" for each of the "RHSL" parameters can be
      from 0-9, a-z.

cg_enemyModel <modelname> (default = "" - disabled)
      Setting this will force all players on the enemy team to
      appear to have this model.  Your teammates will retain their
      models unless you specify g_forcemodel 1, which will force
      all of your teammates to your current model.

cg_execVstr <string> (default = "")
      Specifies a string to exec after connecting to a server.  OSP performs
      "vstr <string>" on the value of this variable.  Helpful for +zoom
      scripts for thin-shaft, as an example.

cg_float <0|1> (default = 0)
      Allows cool float mode of the scoreboard and teamscore
      boxes.

cg_followkiller <0|1> (default = 0 - disabled)
      Allows client to auto-switch to killer of chased player.
      Cool for specing in-eyes 1v1 matches, and cool for viewcam
      player specing in team games.

cg_followpowerup <0|1> (default = 0 - disabled)
      Allows client to auto-follow powerup pickup if spectating.
      Flag carriers have highest precidence in the follow_powerup
      settings.  Once you are on a flag carrier, you will not switch
      automatically unless they are killed or cap the flag.
      Also, if the current powerup player is killed, you will switch
      to another powerup carrier, if one exists (rather than staying
      on the same player, or switching to the killer).

cg_followviewcam <0|1> (default = 1 - follow specific player)
      Toggles use of dynamic or specific player follow mode of the
      viewcam.

cg_forceColors <0|1> (default = 0 - disabled)
      Forces all teammates to your color settings, if using "pm" skins.

cg_lagometer <0|1|2> (default = 1 - lower right)
      Draws the "lag" a player feels (network and rendering) in real time.
          0 - Disabled
          1 - Show in lower right portion of the screen
          2 - Show in upper right portion of the screen

cg_MaxlocationWidth <length> (default = 16)
      Sets maximum locationlength for teamoverlay and teamchat.

cg_muzzleFlash <0|1> (default = 1)
      Specifies if there is a muzzle flash when cg_drawGun is set to 1.

cg_nochatbeep <0|1> (default = 0 - normal chat beeps enabled)
      Allows client to supress "beeps" heard during normal chat
      messages.  Especially convenient when connected to spam-riddled
      QTV servers.

cg_nomip <bitmask> (default = 0 - all gfx follow r_picmip)
      Allows changing graphics to picmip 1 setting, regardless of
      current r_picmip setting.  The parameter for this setting
      is a bitmask:
           1 - LightningGun shaft
           2 - PlasmaGun bolt
           4 - Rocket Launcher explosions
           8 - Grenade Launcher explosions
          16 - Bullets (machinegun and shotgun)
          32 - Railgun
          64 - BFG
         128 - Blood marks
         256 - Smoke puffs

          Note: If you use marks, the marks for each weapon are
                also set to picmip level 0.

cg_NoMOTDDisplayDuringDemo <0|1> (default = 0 - Display MOTD in a demo)
      0 - Always displays the server MOTD during demo playback
      1 - Suppresses the display of the server MOTD during demo playback

cg_oldCTFSounds <0|1> (default = 0 - Use newer CTF sounds)
      Allows the use of "old" CTF sounds in CTF gametype that were
      used prior to the 1.27 patch.

cg_oldPlasma <0|1> (default = 1)
      Alternates between old-style q3 plasmagun and the new plasma graphic
      with sparkles.

cg_oldRail <0|1> (default = 1)
      Alternates between old-style q3 rail and the new rail with the
      Q2 swirl.

cg_oversampleMouse <0|1> - (default = 0 - normal mouse sampling)
      Allows the use of the pmove enhanced mouse sampling on the
      client even if pmove_fixed is forced to 0 on the server.

cg_q3compScoreboard <0|1> (default = 0)
      0 - default id scoreboard
      1 - Q3comp Scoreboard (TDM, CTF and CA only)

cg_scoreTransparency <0.0 - 1.0> (default = 1.0 - full bright)
      Adjusts the alpha channel of the font on the scoreboard.  The
      lower the value, the more transparent the scores will become.

cg_showPlayerLean <0|1> (default = 1 - Show model leaning)
      Allows the disabling of viewed model leaning that was intro-
      duced with 1.27 patch.

cg_statscrolltime <value> (default = 0.15)
      Sets, in seconds, the time it takes for the stats window
      to scroll out and scroll back in.  Setting to 0 forces
      instant on/off action.

cg_swapSkins <0|1> (default = 0 - normal team colors)
      Allows you to reverse skin colors as displayed on-screen.
      Note: announcements, overlays, and the scoreboard will still
      maintain your "real" server-controlled team color.

cg_teamRails <0|1> (default = 0 - rail colors defined by players)
      Forces railtrail colors to coincide with the color of the
      team of the firing players.  Works only for team-based
      gametypes.

      0 - Rail trail colors defined by individual player settings.
      1 - Rail trails will match the color of the team of the firing
          player (i.e. a player on the red team will ALWAYS have
          a red rail trail).
      2 - Use rail color as specified in the R parameter of color1
          for teammates, and the R parameter of cg_enemyColors for
          players of the enemy team.

cg_truelightning <0.0 - 1.0> (default = 0.0)
      Specifies the "lag" imposed on the rendering of the lightning
      gun shaft.  A value of 0.0 is just like the baseq3 version "feel"
      of the lg.  A value of 1.0 imposes no lag at all (shaft is always
      rendered on the crosshairs).  A value of 0.5 is a good mix of the
      two to reduce the wet-noodle effect, while still maintaining
      consistency of where the server actually sees the shaft.

cg_useScreenShotJPEG <0|1> (default = 0 - use .tga for screenshots)
      Allows use of .jpg for screenshots taken with autoscreenshot or
      autoaction settings.
          0 - Use the standard .tga screenshot format
          1 - Use the .jpg screenshot format

color1 <RHSL> (default = 0000 (White))
      Specifies the various color options for yourself (and teammates),
      if using a "pm" skin for a default Q3 model:
          R = rail-core color (this is for all models/skins)
          H = head/helmet color
          S = shirt color
          L = legs color

color2 <char> (default = 0)
      Specifies the rail disc/swirl color.

----> Note: Values of the "char" for color1/color2 can be from 0-9, a-z.


pmove_fixed <0|1> (default = 1 - enabled)
      Allows client to enable enhanced client sampling.  Note, the
      server must allow this setting to be set/changed.

s_ambient <0|1> (default = 1)
	0 - Disables looping ambient sounds of the current map
	1 - Enables looping ambient sounds of the current map
---> Note: If this value is changed while connected, you will automatically
	   vid_restart to enable this option.



Client HUD Settings (requires cg_enableOSPHUD set to 1):
========================================================
ch_3waveFont <0|1> (default = 0 - baseq3 font enabled)
      Toggles the use of the 3Wave font for all client game graphics
      (e.g. scoreboard, teamoverlay, etc.)

ch_ColorLocations <0|1> (default = 1)
        Changes color of locations in teamoverlay to be red or blue if
	the text "Red" or "Blue" is found in the location.

ch_CrosshairColor <string> (default = White)
      usage: ch_crosshaircolor 0xRRGGBB|<color>
             <color>: white, black, red, green, blue, yellow, magenta,
                      cyan, and grey.
      For RGB values, ch_crosshaircolor 0xFF3377 will yield some nice
      weird color, as an example. Important note: cg_crosshairHealth
      overrides this function, turn it off to use colored crosshair.

ch_CrosshairNamesLeft <0|1> (default = 0)
	if enabled, draws crosshairnames left of the hud on top of teamchat.

ch_drawSpeed <0-2> (default = 0)
	0 - Player's current speed is not shown
	1 - Player's current speed is shown in upper right, below time/fps
	2 - Player's current speed is shown in a smaller, transparent font
	    just above the crosshair.

ch_drawFlagNames <0-5> (default = 0)
	0 - default like id
	1 - draw flag carrier's name (but no icons)
	2 - draw flag carrier's name and the icons
	3 - draw flag carrier's name (but no icon) in the lower right
	    corner (Q3comp statusbars only)
	4 - draw flag carrier's name and icon in the lower right
	    corner (Q3comp Statusbars only)

ch_FilterLocationsTeamchat <0|1> (default = 1)
	Filters location strings out of teamchat.

ch_InverseTeamChat <0|1> (default = 1)
	Inverses teamchatwindow.  If enabled, msgs arrived first will be drawn
	on top.

ch_Obituaries <0|1> (default = 1)
	Prints player obituraries messages in the console.

ch_Pickupitem <0|1> (default = 1)
	Draws the icon and string of items when they are picked up.

ch_recordMessage <0|1> (default = 1)
  Toggles the display of the "Recording: xxx" message while a demo
  is being recorded.  Note: the cvar must be set BEFORE a recording
  is started.

ch_StatusbarFormat <0|1> (default = 10)
         0 - will use the default id statusbar format
         1 - will use the OSP default in which only ammo, weapon icon, health,
	     flag (for ctf) and armor are drawn.  Use cf_statusbar to scale
	     the statusbar font size.
         2 - same as 1, but in addition displays a graph of ammo per weapon
	     side by side.
         3 - same as 1, but in addition displays weapon ammo as numbers.
         4 - CPM style 0 hud (like vq3)
         5 - CPM health/armor bars
         6 - CPM style 3
         7 - CPM style 4
         8 - CPM style 5
         9 - Q3Comp style 1
        10 - Q3Comp style 2
        11 - Q3Comp style 3
        12 - Q3Comp style 4

ch_TeamBackground <0|1> (default = 0)
	Disables teambackground color in statusbar, teamchat.

ch_TeamchatOnly <0|1> (default = 0)
	If enabled, only draws teamchat on the bottom left side of the HUD.
	It will suppress team chats showing up in the normal upper left chat
	area.

ch_TeamCrosshairHealth <0|1> (default = 1)
	If enabled, draws health and armor of players in the same team under
	the crosshairname.

ch_Teamoverlay <string> (default = "p12n h/aw l")
	Specifies what items should be displayed in the teamoverlay.  This
	is highly customizable:
	
	fields:
	=======
	p - powerup icons, aligns left
	12n - width of, and the player name itself (name is always required)
	h - player health
	a - player armor
	w - weapon icon
	l - player location

	All other items that cannot be parsed will be inserted between the
	player fields (e.g. ' ' and '/').

ch_Weaponswitch <0-9> (default = 2)
	values:
	=======
	0 - old fashioned id style, horizontal on top of teamchat
	1 - same as 0, though permanent
	2 - vertical, drawn on right side of HUD
	3 - same as 2, though permanent
	4 - vertical, drawn on left side of HUD
	5 - same as 4, though permanent _and_ displays ammo of each weapon
	    next to it.
        6 - CPM left style
        7 - CPM right style
        8 - CPM bottom style
	9 - draws no weapon switch (if you don't need it or you're using
	    statusbarformat 2 or 3)




Client font Settings (requires cg_enableOSPHUD set to 1):
=========================================================
Note: Fonts are set by specifying the width and height of characters
as they should appear.  Take for example: set cf_Statusbar "24x48".
This will make each character or icon in the statusbar 24 pixels
wide and 48 pixels tall.  If the value can't be parsed, it the client
defaults to a 16x16 font.

cf_AmmoStatusbar <XxY> (default = 8x8)
	Font size of the ammo display with ch_statusbarFormat 2 or 3.

cf_CrosshairNames <XxY> (default = 16x16)
        Crosshairnames font size.

cf_Following <XxY> (default = 12x12)
	"Following" message font size.

cf_Fragmsg <XxY> (default = 16x16)
	Font size of the "you fragged" messages on top of your HUD.

cf_Scores <XxY> (default = 16x16)
	Font size of the scorebox on the lower right of the HUD.

cf_Pickupstring <XxY> (default = 16x16)
	Font size for the pickup string.

cf_Statusbar <XxY> (default = 48x48)
	Scales the status bar if ch_statusbarFormat is 1.

cf_Teamchat <XxY> (default = 6x16)
	Font size for teamchat.

cf_TeamCrosshairHealth <XxY> (default = 12x12)
	Font size of crosshairhealth information.

cf_Teamoverlay <XxY> (default = 7x17)
	Font size for the team overlay.

cf_Vote <XxY> (default = 12x12)
	Vote message font size.

cf_WeaponName <XxY> (default = 12x12)
	Font size of the weaponname if ch_weaponswitch is 1.

cf_WeaponSwitch <XxY> (default = 32x32)
	Size of the weaponswitch graphics.


=======================
Helpful Client Settings
=======================
Clients can set:

	set cg_predictItems 0

To avoid some sometimes arbitrary item actions and pickup sounds
that can occur during a match warmup period.


Using the hook:
===============
If the server has the hook enabled, set:

	bind key_name +button5

By pressing and holding key_name (e.g. mouse3), your hook will be
launched and pull you when it lands on an object.  To release the
hook, just release key_name.


Item dropping:
==============
If configured (or voted in), players can drop weapons/ammo in TDM
or CTF games.  The command to drop items is:

	\drop <item_name>

<item_name> can be any of the following:

	sg	(Shotgun)
	gl	(Grenade Launcher)
	rl	(Rocket Launcher)
	lg	(Lightning Gun)
	rg	(Railgun)
	pg	(Plasma Gun)
	bullets	(qty: 50)
	shells	(qty: 10)
	grenades	(qty: 5)
	rockets	(qty: 5)
	lightning	(qty: 80)
	slugs		(qty: 10)
	cells		(qty: 30)

Players may optionally drop flags in CTF by the command:

	\drop flag


Using the ViewCam:
==================
There are several ways to use the viewcam.  To enable:
	- Type: \viewcam in the console
	- Join: \team vc
	- Cycle through to it when in spectator mode

This mode of operation will always locate the most action going
on in the map.  To manually move to different viewcam locations,
type:
	\vc_free

	----> This option toggles either manual or automatic viewcam
		positioning.

You can optionally track a single player with this mode through:
	\vc_follow

To follow a SPECIFIC player, type:
	\vc_follow [PLAYER_ID|PLAYER_NAME]

	----> Note you can just cycle through to a player using the
		jump/croutch keys as well.

The viewcam positions are defined by configuration files that are
map-specific.  If a map does not have a viewcam definition file,
the viewcam will be disabled from use for the current map.

Creating new viewcam definition files is pretty easy and kinda
fun =)  All the documentation you will need (+ additional commands)
is given in the included Docs/osp-q3-Viewcam.txt file.

If you make viewcam definition files that are not included with
the OSP distribution, please send them to me and I will include
them in the next release.  Full credits will of course be given.



Feedback
========
For comments, suggestions, feature requests, bug reports:
   rhea@OrangeSmoothie.org

