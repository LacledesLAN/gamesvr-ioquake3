OSP Tourney DM/CA/CTF for Quake3
================================
Version: 1.01
Date:    18 Dec 01
Site:    http://www.OrangeSmoothie.org
Contact: rhea@OrangeSmoothie.org

----------
制作人员：
----------
主要设计开发人：
	Jason "Rhea" Keimig (rhea@OrangeSmoothie.org)

其他程序人员：
	Sander "Dessignator" Brandenburg (dessignator@OrangeSmoothie.org)
	Kevin "arQon" Blenkinsopp (arqon@promode.org)
	Harvey "]R[Papa" Morris (papa@reactivesoftware.com)
	Jens "Khaile" Bergensten (khaile@www.com)
	Michael "PhaNToM" Billing (phantom@promode.org)
	CPM的其他职员

地图设计及所有和1.0版本地图有关的主要设计人：
	Christian "SHoD" Farcy (shod@noos.fr)

地图设计员：
	Christian "SHoD" Farcy - ospdm1/2/3 - (shod@noos.fr)
	Nicolas "Nunuk" Bouvier - ospdm2 - (nunuk@planetquake.com)
	Benoit "Bal" Stordeur - ospdm3 - (Bal@planetquake.com)
	Todd "Mr.CleaN" Rose - ospdm4 - (mrclean@planetquake.com)
	Scotty "Teddy" Drader - ospdm5 - (sdrader@home.com)
	羐鷖t "DruZli" Atlason - ospdm6 - (drusla@simnet.is)
	Jerry "clem" Dent - ospdm7 - (jed@verio.net)
	German "JaLisK0" Garcia - ospdm8 - (JaLisk0@terra.es)
	"Charon" - ospdm9 - (charon@atlantacon.org)
	Paul "Polo" de Rosanbo - ospdm10 - (polo2ro@fragdome.com)
	Roeland "Geit" Scheepens - ospdm11 - (ouwegeit@goat.gamepoint.net)
	Jeremy "random" Eaton - ospdm12 - (jeremy.eaton@telus.net)
	David "SgtGhost" Levesque - ospca1 - (sgtghost@hotmail.com)
	Rich "Publius" Tollerton - ospctf1 - (rtollert@tranquility.net)
	Daniel "Drunken Boxer" Lanicek - ospctf2 - (dlanicek@yahoo.com)

Voodoo系统:
	"myrddin" (myrdd1n@hotmail.com)

OSP服务器设置工具开发人员：
	Greg "phred" Price (greg@price.org)

安装程序设计员：
	Tim "Gouki" Pearson (gouki@clanavl.com)

OSP 网页:
	"myrddin" (myrdd1n@hotmail.com)
	Tim "Gouki" Pearson (gouki@clanavl.com)




*** 本版本OSP支持1.30以上的Quake3

OSP开发的目的是为了比赛更灵活、更具有竞争性。作为一种MOD，
OSP可以使玩家和服务器管理员在Quake3中操作更加简单和便利。
但它并没有改变任何Quake3的核心本质，所有的核心内容都是
Quake3默认的。


OSP的最新版本（0.99c及更高版本）将Challenge Pro Mode
(http://www.challenge-world.com/promode/)进行了内置。
CPM从玩家和旁观者角度出发，为了使Q3更加激烈而小心的
改变了一些Q3的一些物理属性。体验后，你会觉得它为Q3
加入了很多新乐趣。（如果想知道改变的所有属性，请参看
Docs目录下的CPM-changes.txt）

OSP最新的相关中文文本信息你可以在http://www.q3acn.com获得，
如果有问题请与cat@q3acn.com联系。

============
快速开始
============
将osp-quake3-<version>.zip文件带目录解压到Quake3目录下，
会生成一个"osp"目录，里面有INSTALL.txt文件中所列出的所有
文件。

要创建一个专用OSP服务器（DEDICATED OSP server），只要输入：
----------------------------------------------

（小型服务器）
quake3 +set dedicated 2 +set com_hunkmegs 16 +set fs_game osp +exec <cfg-name>.cfg

（大型服务器）
quake3 +set dedicated 2 +set com_hunkmegs 32 +set fs_game osp +exec <cfg-name>.cfg

----> 如果从以前版本OSP进行升级：
      删除你服务器osp/目录下的所有z-osp-cgameXXX/extra/players.pk3文件。专用
      服务器在osp/目录下要只有一个z-osp-cgameXXX.pk3文件，来避免
      混乱和不必要的.pk3文件（特别是基于Linux/BSD的服务器）


要创建一个LISTEN OSP服务器（既为客户端又为服务器的，在一个机器上运行
的服务器），输入：
----------------------------------------------------------
quake3 +set fs_game osp +exec cfg-SinglePlayer/<cfg-name>.cfg

注意：如果你要建立一个listen服务器，我推荐你应该将osp/paks/目录下的
      z-osp-gameXXX.pk3文件拷贝到osp/目录下。同时，删除osp/vm/目录。
      如果你经历过地图调入后的死机（比如：在热身时间结束后死机），你
      也可以将sv_pure设置为0来建立listen服务器。

**
** LINUX/BSD管理者：在以上例子中以"q3ded"来代替"quake3"。确信增加：
**                        +set fs_basepath <dir> +set fs_cdpath <dir>
**		    这将指向你的Quake3根目录来使服务器能正确下载。同时
**		    增加+set vm_game 2到命令行来确保完全的兼容性。
** 		    


=======
详细资料
=======
我们在Quake3的默认方式中加入了很多特性：

- 增强比赛的方法，通过玩家准备完毕来同步开始比赛（所有比赛模式）

- 额外的游戏模式："Clan Arena"（部落竞技场，简称CA），一个和
  火箭竞技场（RocketArena）类似的Quake模式。

- "Challenge Pro Mode" (CPM)是一种更快、更激烈的游戏方式。你可以在
  所有游戏模式下使用这种特性。

- 多样性的客户端命令补充——允许你使用多种HUD，增强的客户端验证，
  自动录象/截图等。

- 可在所有模式下运行的15张新地图。

- voodoo服务器/客户端的log分析系统。

- OSP服务器设置工具

- 多视角的旁观。OSP支持旁观者在同一时间内在屏幕上旁观多个玩家视角

- 附加旁观模式：ViewCam。这种方式可以使你以一种电影镜头风格来观看
  比赛，从而获得一个更好的观战效果

- 针对每种游戏方式（混战、单挑、组队、夺旗和部落竞技场）有不同的
  丰富的玩家和比赛的状态、参数统计信息。

- 服务器端可定义的“贴图”，16个自定义图形和32个贴图可以被置于每个地图中。

- 从Q3Comp中借鉴的很多改进。

- “教练”旁观者——可以和被指导的队伍成员交谈，为他们行动发出命令，
  观看队员行动等。

- 灵活的过滤功能，可以使服务器管理者轻松的通过玩家的姓名、IP地址、
  密码来拒绝玩家连入服务器，当然也可以通过这些要素来指定连入服务器
  的玩家。

- 先进的、多样性的投票系统

- 动态的地图列表生成系统，当服务器有新地图文件被加载后，可以方便、
  快速改变服务器地图设置。

- 可以快速观察玩家成绩的玩家状态窗。

- 模式设置投票方式——玩家可以通过投票改变现在模式到服务器支持
  的其他模式。

- 新的远程控制命令。

- 用来管理队伍和队员的队长功能

- 可以设置人物的头部、身体、腿部的颜色，而且这三部分颜色可以各不
  相同!一共有10种颜色可以被用来设置。

- 组队中可以锁定队伍不被旁观，从而组织队伍策略的泄露，和被对方利用
  语音通信等工具来获得自己队伍现在的位置、处境等信息。

- 只能旁观红队或蓝队的功能

- 随游戏进行，自动更新服务器公共信息。比如比赛的剩余时间、比分等
  信息，这样可以利用如GameSpy等工具刷新时，可以获得比赛的最新消息。

- 多种加时赛方式。

- 比赛暂停功能（可以被裁判和队长来执行）

- 可选择的多种飞抓设置

- 完整的物品/宝物屏蔽功能。

- 物品替换功能。

- 额外的"skunk"单挑模式。

- 在服务器为q3tourney3修正的组队方式。

- 可以自己定做服务器的MOTD。

- 可以定做在客户端显示的指定的图形。

- 组队/夺旗模式下可扔出物品的选择。

- 可选择Q2盔甲系统。

- 在线路不好的状况下可以获得良好“感觉”的电枪效果的客户端设置

- 可以设置玩家每次重生后可以自动获得的武器/子弹。

- 可以设置玩家开始时的武器。

- 登录是更详细的附加信息

- 修正了id默认游戏方式中的许多缺陷

- 无法枚举的额外的细小的改进

- 俄文版本的说明文档（部分）

- 中文版本的说明文档（部分）


======================
      附录
======================
1. 在Docs/目录下你可以找到：OSP所有的更新内容（在osp-q3-History.txt
   中找到），服务器端参数及其解释（在osp-q3-Variables.txt中），
   以及各种命令解释（在osp-q3-Commands.txt中）

2. 服务器建立的设置范例。你可以根据你的需要来进行适当的修改。

3. 想要获得客户端的所有命令可以在连入OSP服务器后，在控制台输入：

	\help

4. 想要获得所有裁判命令，可以在获得裁判权限后，在控制台输入：

	\ref
或	\r_help

5. 想要获得所有投票选项，可以在控制台输入：

	\callvote ?

6. 如果要获得现在现在投票选项的设置，以及此选项的用法，可以在
   控制台输入：

	\callvote <option_name> ?

   服务器会显示该<option_name>的用法和现在服务器的设置。比如我们
   要看看现在服务器端对雷神环是否进行屏蔽，在控制台输入：

	\callvote quad ?

可以获得：

	Usage: \callvote quad <0|1>
        Enables/disables Quad Damage powerup availability

      Quad Damage is currently ENABLED
    意思是：
        用法： \callvote quad <0|1>
        使用/屏蔽雷神环的使用

       现在可以使用雷神环
=======================
  客户端有用的设置
=======================
虽然OSP Tourney DM/CA/CTF可以被当作一个完全的服务器端模式来运行，
使客户端可以有很多有用的选项设置（具体看osp/docs下的osp-q3-ClientReadme.txt
文件）。可是，如果仅被当作一个服务器端来严格运行，
这里有一些可以帮助你增强游戏的客户端设置。

客户端设置：

	set cg_predictItems 0

来避免有时一些在比赛热身期间可能发生的物品动作和拾取声音（特别是在夺旗中）

使用飞抓：
---------------
如果服务器允许使用飞抓，则设置

	bind key_name +button5

当按住key_name键（比如mouse3）时，你的飞抓将会被发射，在其抓住目标后
会提拉你行动。想松开飞抓时，只要松开key_name键即可。

扔出物品：
--------------
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

玩家可用下面命令随意扔出旗子：
	\drop flag


连接/图形问题
--------------------------
在你的q3config.cfg、autoexec.cfg或你在客户端要运行的其他设置文件中
将com_hunkmegs设置为56或64（先查找现在.cfg中的设置）。你也可以在命令
行中加入：+set com_hunkmegs 56。


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

==========
  其他
==========
感谢a|citizen 和 a|wiseguy（以及整个的abuse队伍）来帮助我的工作，
你可以在http://www.teamabuse.com/中找到他们的信息。

感谢Khaile、Hoony和CPM全体人员，是他们提供了CPM代码和帮助我在OSP中
增加了对CPM的支持，你可以在http://www.change-world.com/promode中
得到他们的相关信息。

感谢这些viewcam的位置文件制定者：
      [AVL]Gouki  - q3ctf3, q3ctf4, q3wctf1-3, japanctf
      jab         - q3ctf1, q3ctf2
      Olzah       - ztn3dm1
      Rune        - q3tourney2
      SoloRail    - q3dm1-4, q3dm8-12
      TrEEcH      - q3dm13, q3dm17, q3jdm8a
      VK-Hunter   - q3dm14-16,19 q3tourney1,3,5, overkill

感谢那些帮助过OSP的人：Godsmurf, Talita, FiTH-arcane,
TrEEcH, Gouki, Olzah, and Smegma (ewww)。抱歉可能因为人过多
我还可能遗漏了几位。

感谢tubesock/Gouki..等来测试，纠错来完善OSP，感谢你们的帮助。

感谢]R[Papa (http://www.reactivesoftware.com)和Strider来协助解决
id的事件/声音问题。

感谢CPMA的arQon在这些时间里对OSP 0.99x系列很多代码片段的帮助。

感谢Strider (Alan Kivlin - akivlin@lineone.net)的客户端125HZ取样补丁
和多视角旁观的一些帮助（象一种酷的夺旗视角我还没有加入）

感谢Jim Luther (dv8|Fia) 和 [AVL]Hifi来帮助我检测到OSP在苹果机上的问题。


感谢Heeler为OSP制作TGA的图片

感谢evolution队伍(http://evolution.clanpages.com)为OSP旁观设置的
多视角旁观选项挑选出一些新的特性。

问题，注解，缺陷，特性要求，请将所有发到：

      rhea@OrangeSmoothie.org

你可以通过我们的主页来获得OSP更新的最新消息

      http://www.OrangeSmoothie.org/beta.html

你也可以来我们的论坛进行交流
      http://www.OrangeSmoothie.org/forum/

我们也有自己的IRC频道，#osp,在EnterTheGame
(irc.enterthegame.com:6667)。在http://www.enterthegame.com
可以获得IRC服务器的最新相关设置。

感谢你使用OSP
-Rhea