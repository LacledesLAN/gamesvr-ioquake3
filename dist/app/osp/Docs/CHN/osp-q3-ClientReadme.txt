OSP Tourney DM/CA/CTF for Quake3
================================
Date:    07 Jan 02
Site:    http://www.OrangeSmoothie.org
Contact: rhea@OrangeSmoothie.org
Version: 1.01

这个说明文档是用来解释OSP Tourney DM/CA/CTF下的客户端增强参数和选项的。



OSP最新的相关中文文本信息你可以在http://www.q3acn.com获得，
如果有问题请与cat@q3acn.com联系。


连接/图象问题：
================
解决方法为：可以通过将你q3config.cfg（在.cfg文件中查找现在已经存在
的设置）、autoexec.cfg或任何你在客户端要执行的设置文件中的
com_hunkmegs设置到56或64。或直接在运行quake3的命令行加入
+set com_hunkmegs 56。



通讯中可以使用的代号
=======================
#A - 盔甲
	目前盔甲数（小写a将可利用彩色字体显示数值大小）

#C - 尸体
	你上次牺牲的位置
	/say_team "Overrun at #C"

#D - 被击败的
	最近一个打倒你的对手
	/say_team "#D is here and he's heavily armed!"

#F - 最近的队友
	在组队模式中报告最近的队友名字

#H - 生命
	目前生命值（小写h将可利用彩色字体显示数值大小）
	/say_team "Hurting bad - #H/#A"

#I - 物品（可获得的最近的物品）
	显示目前可以得到的最近的重要物品（武器、盔甲、宝物或大血），
	包括被扔出的物品。注意：你必须要能*看到*物品中心（而不是
	边缘），这需要你要面对物品。
	/say_team "#I available here"

#K - 子弹（可获得的最近的子弹）
	作用和#I一样。

#L - 位置
	很多地图中原来的位置信息设置的不近合理，比如在PRO-DM6的PG位置
	会被显示为YA。
	"(pF.arQon) (YA): Weapon available"，这样的通讯是不是有点费解？
	现在#L可以显示最近的重要的物品（武器、盔甲、宝物或大血），不管
	物品是否出现。

#M - 需要弹药
	列出你拥有的武器中没有弹药或即将没有弹药（当弹药在0到5之间时）
	的弹药名称清单。
	/say_team "Need #M"

#P - 上次吃到的物品
	报告你上次吃到的物品。对你报告刚吃到的重要物品很
	有帮助（比如quad）
#R - 生命/盔甲（距你最近可获得的）
	作用和#I一样。

#T - 目标
	显示你最近攻击的对手
	/say_team "#T is weak - finish him!"

#U - 宝物
	列出你现在拥有的所有宝物

#W - 当前手持的武器
	显示你当前正在持有武器的简称


	
命名规定
===================
cg_* - 普通客户端选项
ch_* - 客户端HUD设置
cf_* - 客户端字体设置



设置限制
====================
在网上游戏时，下面这些设置会被强制设置

      r_lodcurveerror 被设置为 250
      r_subdivisions 被设置为不大于 80
      cl_znear 被设置为 4
      cl_shownormals 被设置为 0
      cl_showtris 被设置为 0

如果你的设置不符合上面任何一条规则，OSP会通过vid_restart将参数
重新设置为允许的范围。表现在客户端的效果就是，在连入一个服
务器时，你会经历不只一次的地图调入。

其他限制
	
	cg_bobup设置范围为+/-0.005
	cg_fov上限为140
	cg_zoomFov限制为最高140
	游戏时（和在专用服务器上）不允许使用cg_thirdperson视角


信息字体控制
===========================
以下这些字符的显示方法可以被用来在交谈和MOTD信息中显示字符的一些特殊效果。
^B and ^b - 使文本闪烁
^F        - 使文本只在每秒的前半秒显示
^f        - 使文本只在每秒的后半秒显示
^N        - 使文本恢复默认显示
^Xrrggbb  - 允许用户通过rgb数值（hex）定义字体颜色

            (象. ^XFF0000为红色, ^X777777为一种灰色).



客户端命令
===============
addstr [target_string] [source_string]
      将 [source_string] 填加到 [target_string]（只在promode下有用）

currenttime
        显示当前本地时间
menu
	允许来调整各种OSP增强参数和选项。下面写的就是调节客户端选项
        的命令（注意：""之间的单词是真正的命令）
                - "menu" 打开菜单
		- "weapprev"和"weapnext"  用来在菜单中上下翻找
                  选项（这两个命令默认是分别绑定在'['和']'键位）
                - "menuleft"和"menuright"用来选择菜单项目，或着是用来
                  调节一些菜单选项的数值大小。

         建议将这些命令（象weapprev, weapnext, menuleft,
          menuright 和 menu）绑定在一些不常用的键位上，比如：
			bind / menu
			bind [ weapprev
			bind ] weapnnext
			bind ";" menuleft
			bind ' menuright

modif[1..5] stuff
        +modif[1..5] 和 -modif[1..5]是为那些想在一个键上实现多个绑定的人
        而设定的，下面的例子中会对此进行解释：

	  set normkeys "bind 1 weapon 1; bind 2 weapon 2"
	  set altkeys  "bind 1 say_team nme incoming; bind 2 say_team base is safe"
	  +modif1 vstr normkeys
	  -modif1 vstr altkeys
	  bind shift +modif1
          	
        现在当按下SHIFT键时，+modif1会被执行。当松开SHIFT时，-modif1会被执行。
        在这个例子中，当按下SHIFT键时，按1和2会分别执行weapon 1和weapon 2，
        当松开SHIFT时，按1和2会分别执行"say_team nme incoming!" 和
         "say_team base is under attack!"

	上面例子中，先按SHIFT键，再按1键将执行"say_team nme incoming!"，按住
        SHIFT键，同时按下1键，将执行切换到weapon 1的命令。

        use \+modif1 ? to check what's bound to +modif1
        
        用 \+modif1 ?可以检测什么被设置在+modif1

+/-actions
	这是Q3comp版本中的一个作用相同的命令

            set action1up "bind 1 weapon 1; bind 2 weapon 2"
            set action1down "bind 1 say_team nme incoming!; bind 2 say_team base is safe"
            bind shift +action1

	这个例子的作用和上面的例子是一样的。
	你可以设定10个actions（0-9）

serverversion
	显示当前OSP版本和所有服务器使用的pk3文件。
	一个显示demo使用的OSP版本和pk3文件的有用命令
	（在demo演示时也可以使用该命令）


+fire [weap_1] [weap_2] ...
      定义武器切换和射击的连环设置，比如：

         +fire 5 3

      如果可以，则切换到RL并射击，否则切换到SG并射击，否则不做任何动作（只在promode下有用）

select [weap_1][weap_2] ...
	作用和+fire一样，但不同的是不开火。

+vstr [down_command] [upcommand]
      另一个有用的建立武器切换脚本的方法。这里有一个例子：

         set shaft "weapon 6; wait 2; +attack"
         set unfire "-attack"
         bind mouse2 +vstr shaft unfire




常规游戏选项
=====================
下面列出的参数中，cg_*为常规游戏客户端选项，而大部分HUD选项为ch_*和cf_*

cg_altGrenades <0|1> （默认0 - 使用baseq3的手雷skin）
      使用可选的手雷skin/model

cg_altLightning <0|1>（默认0 - 使用新的1.29/promode skin）
      使用1.29以前的电枪skin

cg_altPlasma <0|1> （默认0 - baseq3的skin）
      使用可选的离子枪skin
  
cg_ammoCheck <0|1> （默认为0 - 关闭）
      取消切换到没有子弹的武器的功能

cg_autoAction <option_bitmask> （默认为0）
       在游戏特定点自动执行一个动作。

        <option_bitmask>:
             1 - 在比赛结束时将状态在本地自动保存到一个文本文件  
                 文件被保存在<osp_root>/stats/<date>/<logname>.txt
             2 - 自动保存一比赛结束时的画面
             4 - 自动录demo（需要一个full warmup的服务器-g_warmup = 0）
	     8 - 记录己方队伍状态
	    16 - 记录所有玩家状态

cg_clientLog <数值> （默认为0）
      打开客户端log记录。一个非0的数值"X"（这里"X"为1或更高的数字）会记录下
      游戏中的所有可得的信息。表示颜色的字符被去掉了，时间标记被保留。所有
      信息被记录在osp/client_logs/clientX.txt中（这里的clientX.txt中的X就是
      你前面输入的那个非0的数字）。

cg_Customloc <0|1> （默认为0 - 关闭）
      使用locs/<mapname>.cfg的自定义位置。现在只支持teamoverly的自定义位置。
      以后会支持teamchat位置。要在地图加入一个位置，移动到特定点，然后输入
      \addpos <location name>
      你可以在文件中使用所有的字母的颜色和特殊显示特性。这些位置会被记在
      locs\<mapname>.cfg中。当地图被调入或客户端使用vid_restart后，这些
      位置会被一起调入。

cg_drawCrosshairNames <0|1|2> （默认=1 -显示所有玩家名字）
	0 - 当准星指向玩家时，不显示他们的名字
	1 - 当准星指向玩家时，显示他们的名字
	2 - 只显示队友的名字。

cg_drawDecals <0|1> （默认=1 - 打开）
      打开/关闭游戏中的decals的绘制

cg_enableOSPHUD <0|1> （默认为1 - 使用OSP的HUD）
        是否使用OSP的HUD

cg_enemyColors <RHSL> （默认 = 0000 （白色））
       如果使用Q3默认model的"pm"skin，则此参数用来定义敌人的颜色，
          R - rg的颜色（要cg_teamrails 2）
          H - 头颜色
          S - 身体颜色
          L - 腿颜色
-----> 注意：RHSL参数可以使用0-9，a-z

cg_enemyModel <modelname> （默认为"" - 关闭）
      设置敌人为这种model，队友仍然为各自的model，除非你使用cg_forcemodel 1
      这样队友将和你使用同一种model

cg_execVstr <string> （默认为 ""）
	在连入到一服务器后执行一语句。OSP会执行"vstr <string>"。对于细电枪
	脚本中+zoom很有帮助。

cg_float <0|1> （默认为0）
        允许使用飘动的记分板效果

cg_followkiller <0|1>
      允许客户端自动跟踪到杀死现在被跟踪者的玩家。是一种在单挑和
      组队游戏中比较酷的旁观方法。

cg_followpowerup <0|1>
      允许客户端自动跟踪吃到宝物的玩家。在自动跟踪宝物携带者的设置下，
      携带旗帜的玩家处于被跟踪的最高级别。当你跟踪的正是携带旗帜的玩家
      时，你不能自动进行视角的切换，除非他被击毙或夺旗成功。
      当然如果你跟踪的携带宝物的玩家被击毙后，如果还存在携带宝物的玩家，
      那你的视角会自动切换到另外一个携带报务玩家身上。
      
cg_followviewcam <0|1>
      定义使用动态的、特殊的玩家跟踪视角方式（默认为1，跟踪特定玩家）

cg_forceColors <0|1> （默认 = 0 - 关闭）
      如果使用 "pm" skin，强制所有队友都为你的颜色设置

cg_lagometer <0|1|2> （默认 = 1 - 在右下角显示）
      定义显示线路状况栏的位置
          0 - 不显示
          1 - 在右下角显示
          2 - 在右上角显示

cg_MaxlocationWidth <长度> （默认 = 16）
        设置teamoverly和teamchat时的本地最大显示长度

cg_muzzleFlash <0|1> (default = 1)
	设置当cg_drawGun为1时，是否显示开火时枪口处的溅火效果。

cg_nochatbeep <0|1> （默认 = 0 - 即听到提示音）
      允许客户端在接到正常交谈消息时听到"滴"的提示音。在连入QTV
      服务器时特别有用

cg_nomip <bitmask> （默认为0，所有gfx设置与r_picmip相同）
       不管现在的r_picmip设置为什么，允许图象变换到picmip 1的设置。
         bitmask
           1 - LightningGun shaft                 电枪
           2 - PlasmaGun bolt                     等离子枪
           4 - Rocket Launcher explosions         火箭炮的爆炸效果
           8 - Grenade Launcher explosions        手雷的爆炸效果
          16 - Bullets (machinegun and shotgun)   子弹（机枪和霰弹枪）
          32 - Railgun                            涡轮枪
          64 - BFG                                BFG
         128 - Blood marks                        血迹
         256 - Smoke puffs			  烟雾

	   注意如果使用了marks，则所有武器的marks都被设置成了picmip 0
          
cg_NoMOTDDisplayDuringDemo <0|1> （默认为0，在录象中显示MOTD）
	0 - 播放录象时，总是显示服务器的MOTD
	1 - 播放录象时，不显示服务器的MOTD

cg_oldCTFSounds <0|1> （默认为0，不使用）
      允许使用1.27以前的CTF音效

cg_oldPlasma <0|1> （默认为1）
      定义使用老的或新的离子枪子弹效果

cg_oldRail <0|1> （默认为1）      
      定义使用老的或新的RG子弹效果

cg_oversampleMouse <0|1> - （默认0 - 普通鼠标采样）
      如果pmove_fixed在服务器被强制为0，允许客户端使用pmove增强鼠标采样率

cg_q3compScoreboard <0|1> （默认 = 0）
        0 - id默认的记分板
        1 - q3comp记分板（TDM、CTF和CA模式下）

cg_scoreTransparency <0.0 - 1.0> （默认 = 1.0 - 全透明）
      调整记分板字体的alpha通道。数越小，字体约透明
      （默认为1.0）

cg_showPlayerLean <0|1> （默认 = 1 - 显示model倾斜）
      允许关闭1.27中的model倾斜问题

cg_statscrolltime <value> （默认 = 0.15）
     设置stat窗口卷入卷出的时间。设置为0则强制直接显示（不绕卷）

cg_swapSkins <0|1> （默认为0，不颠倒）
      允许你使用与当前相反的皮肤颜色。但是announcements, overlays,记分板
      仍然显示你真正的颜色。

cg_teamRails <0|1> （默认 = 0 - RG轨迹颜色有玩家各自设置决定）
      设置玩家rg轨迹的颜色，但只在组队模式下有效
      
      0 - rg轨迹为玩家各自设置的颜色
      1 - rg轨迹为队伍的颜色（比如红队所有队员的rg轨迹都是红色的）
      2 - 队友rg轨迹颜色由color1中的R参数决定，敌人rg轨迹颜色由cg_enemyColors的R参数决定

cg_truelightning <0.0 - 1.0> （默认 = 0.0）
      是否将电枪表现为延迟效果的参数。设置成0.0则使用quake3原来的延迟
      “感觉”。设置成1.0则不会有任何延迟感（电枪的轨迹将总是和准星重合）。
      设置成0.5则是以上两种效果最好的中和。

cg_useScreenShotJPEG <0|1> （默认 = 0 - 使用.tga截图）
      允许玩家使用jpg的截图来实现自动截图
          0 - 使用tga截图
          1 - 使用jpg截图

color1 <RHSL> （默认 = 0000 （白色））
      在使用了q3默认model的“pm”skin时，定义自己（和队友）的颜色

          R - rg轨迹核心的颜色
          H - 头颜色
          S - 身体颜色
          L - 腿颜色          

color2 <char> （默认 = 0）
      定义rg轨迹涡轮颜色

----> 注意：color1/color2 “char”可从0-9，a-z

pmove_fixed <0|1> （默认 = 1 - 打开）
      允许客户端使用客户端取样。但必须是服务器支持。

s_ambient <0|1> （默认 = 1）
	0 - 关闭当前地图环境音效
	1 - 打开当前地图环境音效
---> 注意：如果设置为1连入服务器时，你会被通过vid_restart来实现1的效果。

cg_drawgun <0|1|2> （默认 = 1）
	0 - 不显示武器
	1 - 显示晃动的武器
	2 - 显示不晃动的武器


客户端HUD设置（需要cg_enableOSPHUD被设置为1）
========================================================
ch_3waveFont <0|1> （默认1 - 可以使用3wave字体）
      定义客户端是否可以使用3wave字体（比如在记分板、队友状态栏等）

ch_ColorLocations <0|1> （默认 = 1）
        如果位置的文本颜色为红或蓝，改变teamoverly中位置的颜色到红或蓝。

ch_CrosshairColor <string> （默认 = 白色）
      改变准星的颜色
       用法：ch_crosshaircolor 0xRRGGBB|<color>
             <color>:white, black, red, green, blue, yellow, magenta,
                      cyan, 和 grey.
       用RGB的数值，例子ch_crosshaircolor 0xFF3377会产生一种奇妙的颜色。
       特别要注意：cg_crosshairHealth必须关闭掉（也就是cg_crosshairHealth
       要为0），ch_CrosshairColor才能起作用。

ch_CrosshairNamesLeft <0|1> （默认 = 0）
        如果打开，则在teamchat顶端HUD的左边显示名字

ch_drawSpeed <0-2> （默认 = 0）
	0 - 不显示玩家现在的速度。
	1 - 在右上角时间/FPS的下面显示玩家的速度。
	2 - 玩家的速度以小而透明的字体显示在准星上方。

ch_drawFlagNames <0-5> （默认 = 0）
	0 - id默认
	1 - 显示夺旗手名字（没有icon）
	2 - 显示夺旗手名字和icon
	3 - 在右下脚显示夺旗手名字（没有icon）（只在q3comp状态栏下有效）
	4 - 在右下脚显示夺旗手名字和icon（只在q3comp状态栏下有效）

ch_FilterLocationsTeamchat <0|1> （默认 = 1）
        从teamchat中过滤掉位置信息

ch_InverseTeamChat <0|1> （默认 = 1）
        反转teamchat窗口。如果打开，则先到的信息显示在顶端。

ch_Obituaries <0|1> （默认 = 1）
        在控制台是否显示玩家被杀信息

ch_Pickupitem <0|1> （默认 = 1）
        当物品被吃时，显示他们的icon和字符

ch_StatusbarFormat <0|1> （默认 = 1）
         0 - 使用id默认的状态条
         1 - 使用osp默认的状态条。显示子弹图标、武器图标、健康状况、旗子（ctf下）
             和盔甲。使用cf_statusbar来scale状态条字体大小
         2 - 和1一样，但在边上显示每种武器子弹的图象
         3 - 和1一样，但武器子弹以数字显示
         4 - CPM 风格0 hud (象 vq3)
         5 - CPM 血/甲 条
         6 - CPM 风格 3
         7 - CPM 风格 4
         8 - CPM 风格 5
         9 - Q3Comp 风格 1
        10 - Q3Comp 风格 2
        11 - Q3Comp 风格 3
        12 - Q3Comp 风格 4


ch_TeamBackground <0|1> （默认 = 0）
        在状态条，队友通讯中关闭组队背景颜色（默认为0）

ch_TeamchatOnly <0|1> （默认 = 0）
        如果打开，则在HUD的左下角只显示队友通讯。

ch_TeamCrosshairHealth <0|1> （默认 = 1）
        如果打开，则当准星对准队友时，在准星名字下显示其
        血、甲，只有在teamoverlay打开时有效。

ch_Teamoverlay <string> （默认 = "p12n h/aw l"）
        定义显示teamoverlay中的信息的大小。
        fields:
	=======
	p - 宝物图标，在左
	12n - 名字宽度（名字是必须的）
	h - 玩家血
	a - 玩家甲
	w - 武器图标
	l - 玩家位置

	所有其他不能分列的物品将被插入到玩家fields中（比如' ' 和 '/'）


ch_Weaponswitch <0-9> （默认 = 2）
	参数:
	=======
	0 - 老的id风格，在队友通讯的顶端
	1 - 和0相同,但是为数字
	2 - 垂直的，表现在HUD的右边
	3 - 和2相同，但是为数字
	4 - 垂直的，表现在HUD的左边
	5 - 和4相同，但是为数字并且显示每个相邻武器的子弹
        6 - CPM左边风格
        7 - CPM右边风格
        8 - CPM底端风格
	9 - 不显示武器切换（如果你不需要或你正在使用状态栏格式的2或3）
        



客户端字体设置（需要cg_enableOSPHUD设置成1）
=========================================================
注意：字体只有被设置成指定的宽度和高度时，才能正确显示。比如：设置
cf_Statusbar "24x48"。这样状态栏中的每个字符或图标为24个像素宽，48个
像素高。当字体设置不被接受时，显示默认的16*16字体。

cf_AmmoStatusbar <XxY> （默认 = 8x8）
        ch_statusbarFormat 2或3时，显示子弹的字体大小

cf_CrosshairNames <XxY> （默认 = 16x16）
        准星指向名称字体大小

cf_Following <XxY> （默认 = 12x12）
        "Following"信息字体大小

cf_Fragmsg <XxY> （默认 = 16x16）
        HUD顶端"you fragged"字体大小

cf_Scores <XxY> （默认 = 16x16）
        HUD右下角分数字体大小

cf_Pickupstring <XxY> （默认 = 16x16）
        拾取信息字体大小

cf_Statusbar <XxY> （默认 = 48x48）
        当ch_statusbarFormat为1时，状态栏字体的大小

cf_Teamchat <XxY> （默认 = 6x16）
        队友通讯字体大小

cf_TeamCrosshairHealth <XxY> （默认 = 12x12）
        准星指向显示的健康程度信息字体的大小

cf_Teamoverlay <XxY> （默认 = 7x17）
        teamoverlay字体大小

cf_Vote <XxY> （默认 = 12x12）
        投票信息字体大小

cf_WeaponName <XxY> （默认 = 12x12）
        ch_weaponswitch为1时，武器名称字体大小

cf_WeaponSwitch <XxY> （默认 = 32x32）
        武器开关图象大小


=================
有用的客户端设置
=================
客户端可以设置：

	set cg_predictItems 0

来避免有时一些在比赛热身期间可能发生的物品动作和拾取声音（特别是在夺旗中）

使用飞抓：
============
如果服务器允许使用飞抓，则设置

	bind key_name +button5

当按住key_name键（比如mouse3）时，你的飞抓将会被发射，在其抓住目标后
会提拉你行动。想松开飞抓时，只要松开key_name键即可。

扔出物品：
==========
如果设置（或通过投票通过）允许玩家在组队或夺旗中扔出武器/子弹。
扔出物品的命令是：

	\drop <item_name>

<item_name> 可以为以下物品
	sg	(Shotgun)（霰弹枪）
	gl	(Grenade Launcher)（手雷）
	rl	(Rocket Launcher)（火箭炮）
	lg	(Lightning Gun)（电枪）
	rg	(Railgun)（涡轮枪）
	pg	(Plasma Gun)（等离子枪）
	bullets	(qty: 50)（机枪子弹，数量50）
	shells	(qty: 10)（霰弹枪子弹，数量10）
	grenades	(qty: 5)（手雷，数量5）
	rockets	(qty: 5)（火箭弹，数量5）
	lightning	(qty: 50)（电枪子弹，数量50）
	slugs		(qty: 10)（涡轮枪子弹，数量10）
	cells		(qty: 50)（BFG子弹，数量50

玩家在CTF中可用下面命令随意扔出旗子：
	\drop flag

使用ViewCam
------------------
可以有几种不同的方法来使用viewcam，分别为：
	- 在控制台输入: \viewcam
	- 加入: \team vc
	- 在旁观模式中循环查看它的各个位置

这个方式中的观察点都是地图中经常发生战斗的地方。如要手工到一个不同
的viewcam位置，输入：

	\vc_free

	----> 这个命令用来切换手工还是自动的viewcam定位

你可以在这个方式下跟踪一个玩家：
	\vc_follow

要跟踪一个指定的玩家，输入：
	\vc_follow [PLAYER_ID|PLAYER_NAME]

	----> 注意你可以使用跳跃/下蹲键来切换跟踪玩家

viewcam位置是存放在为每个地图制定的特别设置文件中的，如果一个地图
没有viewcam位置定义文件，那这个地图的viewcam功能将被关闭。

创建一个新的viewcam定义文件是件很容易和有趣的工作。所有有关命令
都在Docs/Viewcam-info.txt中。

如果你自己做了一个OSP没有包含的viewcam定义文件，请把它发给我，它
会出现在下一个版本中。当然你的名字也会在制作人名单中出现。



反馈
========
注解，建议，特性要求，bug报告请email：
   rhea@OrangeSmoothie.org

