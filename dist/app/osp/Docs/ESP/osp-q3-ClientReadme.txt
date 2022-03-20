OSP Tourney DM/CA/CTF para Quake3
================================
Fecha:    14 Dec 01
Sitio:    http://www.OrangeSmoothie.org
Contacto: rhea@OrangeSmoothie.org
Versión:  1.0

====================================================
 Traducido al Español por el equipo Rancid:
====================================================
 - Pablo González 	alias Totoro
 - Roberto Konow 		alias Ratón
 - Antonio Inocencio	alias Nyto
 - Mauricio Quilpatay 	alias Phobos

 WWW:		http://www.rancid.cl
 Email: 	webmaster@rancid.cl
 IRC:		#rancid on irc.enterthegame.com

 --> Visita www.rancid.cl para obtener noticias
     del E-Sport y Quake3 totalmente en Español.
====================================================
====================================================

Este documento explica los comandos avanzados del cliente 
y sus opciones en el  OSP Tourney DM/CA/CTF.

Problemas de Conexión/graficos:
==============================
Trata de setear el com_hunkmegs a 56 ó 64 en tu q3config.cfg (busca 
por el valor actual en el archivo .cfg), autoexec.cfg or cualquier 
config que ejecute el cliente para entrar al juego.  Incluso puedes 
especificarlo en la línea de comando con: +set com_hunkmegs 56.

Definición de nombres:
======================
cg_* - Opciones Generales del cliente.
ch_* - Opciones relacionadas con el HUD del cliente.
cf_* - Opciones relacionadas con las letras (fuentes) del HUD.


Caracteres de control de Mensajes:
===========================
Los siguientes caracteres describen opciones adicionales que se 
pueden usar en los mensajes dentro del team,
nombres usando OSP, en el HUD o los mensajes MOTD.

^B y ^b - Hace que el Texto parpadee 
^F        - Hace que el texto solo se muestre en el primer medio segundo 
^f        - Hace que el texto solo se muestre en el ultimo medio segundo 
^N        - Resetea los comandos como ^B, ^F, ^f
^Xrrggbb  - Permite al usuario definir los colores usando valores rgb  (hex)

            (Ej: ^XFF0000 Es rojo, ^X777777 Es algún tipo gris).

Restricciones de valores
========================
Los siguientes valores están forzados para un juego en internet:

      r_lodcurveerror debe estar en 250
      r_subdivisions no debe ser mayor que 80
      cl_znear debe estar en 4
      cl_shownormals debe estar en 0
      cl_showtris debe estar en 0

Si tu tienes estos valores que violan cualquiera de estar reglas, OSP 
dejará un valor aceptable para este comando y provocará un vid_restart. 
Por otro lado este efecto hace parecer que el mapa cargue más de una vez 
al conectarse al servidor.

Otras alertas:

	cg_bobup restringido a +/- 0.005
	cg_fov el limíte superior está restringido a 120, a menos que
 	en la vista con zoom cg_zoomFov esté restringida a 120
	no existe la vista cg_thirdperson si se está en el juego (y e
 	un server dedicado)



Símbolos de chat disponibles
============================
#A - Armadura
	Valor de la armadura actual

#C - Muerte
	Locación donde te moriste la ultima vez
	/say_team "#C invadida"

#D - Dañado por
	Último jugador que te infligió algún daño
	/say_team "#D está aquí y está fuerte mente armado!" 

#H - Salud
	Valor de la salud actual
	/say_team "Estoy malherido - #H/#A"

#I - Item (más cercano disponible)
	Muestra el item más "significante" (arma, armadura, powerup, o
 	MH) disponible, y incluye los items tirados  :)
	/say_team "#I disponible aquí"

#L - Locación
	Muchos mapas tienen muchas marcas de locaciones ej: PG en PRO-
	DM6 muestra el YA
	"(pF.arQon) (YA): Arma disponible" es un poco mal, no?
	Esto muestra el más cercano "significante" item aparecido
	(arma, armadura, powerup, o 	MH),  si el item está ahi o no

#M - munición esperada
	Lista todo los tipos de municiones para las armas que están
 	vacías o casi vacías (entre 0 y 5 de munición).
	/say_team "Necesito #M"

#P - Powerups
	Lista todos los powerups que tienes actualmente

#T - Target
	El último jugador al cual golpeaste
	/say_team "#T está débil! - mátenlo!"


Comandos del cliente
===============
currenttime
	Muestra la hora local.

menu
	Permite el ajuste de varias opciones y variables en el OSP.
 	Abajo	hay una descripción de los comandos importantes para 	poder
	utilizar esta opción en el juego. (nota: las palabras
 	entre "" son comandos de consola):
		- "menu" Habilita el menú
		- "weapprev" y "weapnext" para moverse de arriba o abajo
 		   en el menu (normalmente esta seteado a '[' y ']' por
 		   defecto).
		- "menuleft" y "menuright" para seleccionar opciones del
 	         menú, o para agregar o quitar valor a algunas
		   opciones.

		Es recomendado que bindear estos comandos: (es decir
		weapprev, weapnext, menuleft, menuright and menu) a
 			algunas teclas cómodas:
			bind / menu
			bind [ weapprev
			bind ] weapnnext
			bind ";" menuleft
			bind ' menuright

modif[1..5] stuff
        +modif[1..5] y -modif[1..5] soporta la opción para las
 	  personas que quieran un "doble bind" para múltiples
  	  secuencias, como en el siguiente ejemplo: 

	  set normkeys "bind 1 weapon 1; bind 2 weapon 2"
	  set altkeys  "bind 1 say_team nme incoming; bind 2 say_team                         			    la base está segura"
	  +modif1 vstr normkeys
	  -modif1 vstr altkeys
	  bind shift +modif1
	
      Ahora cuando se dejes presionada la tecla SHIFT, +modif1 será
 	ejecutado. Cuando se suelte la tecla, el vsrt dirigido a
 		-modif1 será ejecutado. 
      En este ejemplo, presionar la tecla SHIFT va a bindear las
 	teclas 1 y 2 a las armas 1 y 2. Cuando  se suelte la tecla, las
 	teclas 1 y 2 estarán bindeadas a "say_team viene el enemigo!" y
 	"say_team la base está bajo ataque!".

	En el ejemplo pasado si presionas la tecla SHIFT y la sueltas y
 	después presionas la tecla 1, va a dar como resultado "say_team
 	viene el enemigo!". 
      Presionando y MANTENIENDO la tecla SHIFT y presionar la tecla 1
 	va a cambiar a la arma 1. 

        usa  "\+modif1 ?" para ver que esta bindeado a +modif1 

+/-actions
        Este es la versión Q3comp de la misma idea:

	    Ejemplo:
	    set action1up "bind 1 weapon 1; bind 2 weapon 2"
          set action1down "bind 1 say_team nme incoming!; bind 2 
	    say_team base is safe"
          bind shift +action1

        Esto hará lo mismo que el ejemplo del comando "modif" 
        Puedes tener hasta 10 actions. (0-9)

+vstr [comando_bajo] [comando_alto]
      Otra manera util para crear scripts de cambio de armas. Aquí hay un ejemplo:

         set shaft "weapon 6; wait 2; +attack"
         set unfire "-attack"
         bind mouse2 +vstr shaft unfire

+fire [weap_1] [weap_2] ...
      Especifica una cadena de armas para cambiar a y disparar, ej:

         +fire 5 3

      Cambia a y dispara el RL, si esta disponible, sino cambia a la SG y dispara
      sino ninguna acción ocurre (solo promode).

addstr [target_string] [source_string]
      Apunta [source_string] a [target_string] (solo promode)


Opciones Generales del Juego
============================
Las opciones generales del juego están en la categoría cg_*.
Para la mayor parte de  las opciones del HUD (heads-up-display),
mira las opciones ch_* y  cf_*, listadas en las siguientes secciones.

cg_altGrenades <0|1> (defecto = 0 - skin de granadas baseq3)
      Utiliza una alternativa del skin/modelo para las granadas.

cg_altLightning <0|1> (defecto = 0 - nuevo 1.29/promode skin)
      Utiliza el skin original (pre 1.29) para el rayo de la
 	lightning gun.

cg_altPlasma <0|1> (defecto = 0 - skin de plasma baseq3)
      Utiliza una alternativa del skin/modelo para los disparos de la
 	Plasma Gun.

cg_ammoCheck <0|1> (defecto = 0 - deshabilitado)
      Deshabilita la posibilidad de cambiar a una arma que no tenga
 	municiones (ammo). Útil para binds de múltiples-armas.

cg_autoAction <option_bitmask> (defecto = 0)
      Realiza acciones automáticas para ciertos puntos durante el
 	juego.

       <option_bitmask>:
             1 - Guarda automáticamente un texto al final de un
 			     Match. 
		 Estos Textos (Logs) serán guardados en:
                 
                   <osp_root>/stats/<date>/<logname>.txt

             2 - Toma un screenshot automáticamente al terminar un
 		     Match. 
             4 - Graba un demo automáticamente (requiere un servidor 
		     con warmup - g_warmup = 0)
             8 - Muestra las estadísticas de las armas del tu equipo
            16 - Muestra las estadísticas de las armas de los
 			     jugadores

cg_clientLog <valor> (Defecto = 0)
      Permite la opción de loggear desde el clientes. Un valor que no
 	sea cero de X (donde "X" es 1 o mayor) Habilita el loggeo de
 	todos los mensajes realizados durante el partido. Los colores y
 	tiempos también son incluidos!
      El log de cliente queda guardado en  	osp/client_logs/clientX.txt.

cg_Customloc <0|1> (Defecto  = 0 - deshabilitado)
      Usa información personalizada de los lugares (De Archivos que
 	están en el directorio locs/<mapname>.cfg). Para el teamoverlay
 	y el teamchat. Para agregar un lugar en especial para un mapa,
 	encuentre un sitio en particular y después:
     
            \addpos <Nombre del Lugar>

      Se pueden usar todo tipo de colores o caracteres especiales en
 	el campo "Nombre del Lugar". Este punto de referencia será
 	agregado a locs\<mapname>.cfg todas las veces que una posición
 	sea agregada.

      Estos Lugares son cargados cuando se carga un mapa o cuando el
 	cliente hace "vid_restart". Si un archivo 'customloc' no se
 	encuentra para el mapa, la información de los lugares que serán
 	mostrados, van a ser los de defecto que vienen con el mapa.

cg_deadBodyFilter <0|1> (default = 0 - Muestra cuerpos muertos)
      Habilita/deshabilita el poder mostrar los cuerpos muertos en un nivel.
      
cg_drawDecals <0|1> (defecto = 1 - Habilitar el poner logos)
      Habilita o deshabilita el poder ver el logo en los mapas.

cg_enableOSPHUD <0|1> (defecto = 1 - habilitar el OSP-basado HUD )
      habilita el OSP-basado HUD.

cg_enemyColors <HSL> (defecto = 0000 (blanco))
      Especifica los colores para tus enemigos ,si se usa el skin 
      "pm" skins para los modelos:
          R = color de la rail (para cg_teamrails 2)
          H = color de la cabeza/casco
          S = color del Torso
          L = color de las piernas

----> Nota: Valores del "caracter" para cada parámetro "RHSL" puede
 ser desde 0-9,a-z
      
cg_enemyModel <nombre_del_modelo> (defecto = "" - inhabilitado)
      Dejar este comando va a forzar a todos los jugadores del equipo
 	enemigo a aparentar usar este modelo. Tus compañeros de equipo
 	van a mantener sus modelos a menos que se use el comando
 	"cg_forcemodels 1" que fuerza todos los modelos a ser iguales.

cg_float <0|1> (defecto = 0)
      Permite un modo "flotante" de ver los resultados.

cg_followkiller <0|1> (defecto = 0 - inhabilitado)
      Permite al cliente cambiar automáticamente el asesino del
 	jugador actual.
      Recomendable para los Matches 1v1 y excelentes para los
 	espectadores de matches en equipo.

cg_followpowerup <0|1> (Defecto = 0 - Inhabilitado)
      Permite al cliente auto dirigirse al jugador que tomo un
 	powerup si se esta espectando. Los Flag carriers tienen mayor
 	importancia en el comando Follow_powerup. Una vez que estés
 	espectando a un flag carrier, no será cambiado a menos maten a
 	este o que capture. También, si el jugador actual que tenga el
 	powerup es asesinado, la cámara será cambiada a otro jugador
 	con powerup, si este existe.

cg_followviewcam <0|1> (defecto = 1 - Sigue a un jugador en especifico)
      Permite el uso del modo dinámico o especifico de la viewcam en
 	un jugador en especifico

cg_forceColors <0|1> (defecto = 0 - Inhabilitado)
      Fuerza a todos los compañeros de equipo a usar tus opciones de
 	colores, si se usan los skins "PM". 

cg_lagometer <0|1|2> (defecto = 1 - Abajo Derecha)
      Dibuja la cantidad de "lag" que el jugador siente (estado de la
 	red) en tiempo real.
          0 - Inhabilitado
          1 - Muestra en la parte de abajo a la derecha de la
 			  pantalla.
          2 - Muestra en la parte de arriba a la derecha de la
 			  pantalla.

cg_MaxlocationWidth <longitud> (defecto = 16)
      Setea el maximo locationlenght para el teamoverley y team chat. 

cg_nochatbeep <0|1> (defecto = 0 - Habilita los sonidos de chat)
      Permite al cliente a suprimir los "beeps" que se escuchan en un
 	mensaje normal de chat. Especialmente recomendado cuando se
 	esta conectado a un QTV server.

cg_nomip <bitmask> (defecto = 0 - todos los gfx siguen al r_picmip)
      Permite cambiar los gráficos a picmip 0, dependiendo del valor
 	del actual r_picmip .  Los parámetros para esta opción son un
 	bitmask:
           1 - Rayo de la LightningGun 
           2 - PlasmaGun bolt
           4 - Explosiones del Rocket Launcher
           8 - Explosiones del Grenade Launcher 
          16 - Balas (machinegun y shotgun)
          32 - Railgun
          64 - BFG
         128 - Marcas de sangre
	 256 - Estelas de humo

          Note: Si usas marcas, estas para cada arma serán seteadas a 
                picmip nivel 0.

cg_oldCTFSounds <0|1> (defecto = 0 - Usa los nuevos sonidos de CTF)
      Permite el uso de los sonidos antiguos para el tipo de juego
 	CTF, que fueron usados para las versiones antigua a la 1.27. 

cg_oldPlasma <0|1> (defecto = 1)
      Alterna entre el estilo viejo de la plasma gun de quake3 y 
      el nuevo grafico con partículas.

cg_oldRail <0|1> (default = 1)
      Alterna entre el estilo viejo de la Railgun de quake3 y 
      el nuevo grafico similar a quake2.

cg_oversampleMouse <0|1> - (defecto = 0 - normal mouse sampling)
      Permite al cliente el uso pmove avanzado del mouse aun si
      el comando pmove_fixed esta forzado a 0 en el servidor. 

cg_q3compScoreboard <0|1> (defecto = 0)
      0 - Id tabla de resultados de defecto.
      1 - Tabla de resultados Q3comp.

cg_scoreTransparency <0.0 - 1.0> (defecto = 1.0 - Brillo)
      Ajusta el canal alfa de las letras en la tabla de resultados. 
      Mientras menor sea el valor, mas transparente será la tabla de
 	resultados.

cg_showPlayerLean <0|1> (defecto = 1 - Show model leaning)
      Permite deshabilitar animación de salto, que fue introducida en
 	el parche 1.27.

cg_statscrolltime <value> (defecto = 0.15)
      Setea, en segundos, el tiempo que le toma a la ventana de
 	estadísticas para moverse arriba y abajo Seteando a 0 fuerza la
 	accion on/off instantánea.

cg_swapSkins <0|1> (defecto = 0 - colores normales del equipo)
      Permite revertir los colores de los skins como se muestran en
 	la pantalla.
      Nota: los anuncios, overlays, y el marcador mantendrá un "real"
      control del server en los colores del equipo.

cg_teamRails <0|1> (default = 0 - rail colors defined by players)
      Fuerza los colores de la estela de la railgun para que coincida 
      con el color del equipo de los jugadores que disparan.
      Solo funciona para modos de juego en equipos.

      0 - Color de la estela definido por cada jugador.
      1 - La estela de la rail va a coincidir con el color del equipo
 	    que dispara 
          (por ejemplo: Un jugador del equipo rojo siempre tendrá la
 	    estela de la railgun roja).
      2 - Usa el color de la rail como se especifica en el parámetro 
	    R del comando "color1" para compañeros de equipo y
 		    parámetro R para "cg_enemycolors" para los del equipo
 	    enemigo. 

cg_truelightning <0.0 - 1.0> (Defecto = 0.0)
      Especifica el lag impuesto en el render del rayo de la
 	lightinggun. 
      Un valor de 0.0 será justo como sentir el lg igual a la versión
 	baseq3. 
      Un valor de 1.0 impondría ningún lag en absoluto (el rayo
 	siempre estará  
      pegado a la mira). Un valor de 0.5 es una buena mezcla para
 	reducir el efecto de "tallarín-humedo", mientras que sigue
 	manteniendo concistendia donde el servidor actual ve el shaft.

cg_useScreenShotJPEG <0|1> (Defecto = 0 - Usar formato .tga para las screenshots)
      Permite el uso de screenshots en formato .jpg tomados con el
 	comando "autoscreenshot" o acción automática del servidor.
          0 - Usa el formato .tga
          1 - Usa el formato .jpg 

color1 <RHSL> (defecto = 0000 (blanco))
      Especifica las variadas opciones de color para el jugador y los
 	compañeros de equipo, si se utiliza un skin "PM" para un modelo
 	de quake3 por defecto:
          R = Color del centro de la rail (esto es para todos los
 		  modelos y skins)
          H = color de la cabeza/casco
          S = Color del torso
          L = Color de las piernas

color2 <char> (default = 0)
      Especifica el color del disco de la rail

----> Nota: Valores del "caracter" para color1/color2 pueden ser desde 0-9, a-z.

pmove_fixed <0|1> (defecto = 1 - Habilitado)
      Permite al cliente el uso de movimientos avanzados.
      Nota, el servidor tiene  que tener esta opción habilitada. 
      

Opciones del HUD del cliente  (requiere cg_enableOSPHUD en 1):
=================================================================
ch_ColorLocations <0|1> (defecto = 1)
        Cambia el color de las posiciones del teamoverlay a azul o rojo,
        Si el texto "red" o "blue' es encontrado en la posición.

ch_CrosshairColor <string> (Defecto = Blanco)
      uso: ch_crosshaircolor 0xRRGGBB|<color>
             <color>: white, black, red, green, blue, yellow,
 				    magenta, cyan, y grey.
     	Para valores RGB, ch_crosshaircolor 0xFF3377 va a obtener un
 	bonito y loco color como un ejemplo. Nota importante:
 	cg_crosshairHealth sobrepasa esta función, debe estar
 	deshabilitada para usar esta función.

ch_CrosshairNamesLeft <0|1> (defecto = 0)
	Si se habilita, dibuja los nombres bajo mira a la izquierda del
 	HUD arriba del chat del equipo.

ch_drawSpeed <0-2> (defecto = 0)
	0 - La velocidad actual del jugador no se muestra.
	1 - La velocidad actual del jugador se muestra arriba a la
 	    derecha, abajo del tiempo/fps
	2 - La velocidad actual del jugador se muestra en pequeño, y
    	    con fuente transparente justo abajo de la mira.

ch_drawFlagNames <0-5> (defecto = 0)
	0 - Defecto
	1 - Dibuja el nombre del jugador con la bandera (pero sin
 	    íconos)
	2 - Dibuja el nombre del jugador con la bandera y con íconos.
	3 - Dibuja el nombre del jugador con la bandera(pero sin
     	    íconos) en la esquina inferior derecha (barra de		
	    estadísticas de Q3comp solamente)
	4 - Dibuja el nombre del jugador con la bandera y con iconos en
 	    la parte inferior derecha (barra de estadísticas de Q3comp
 	    solamente)

ch_FilterLocationsTeamchat <0|1> (defecto = 1)
	Filtra los nombre de posiciones en el chat del equipo.

ch_InverseTeamChat <0|1> (defecto = 1)
	Invierte la ventana de chat del equipo. Si se habilita, los
 	mensajes que arriben serán escritos arriba de los demás.

ch_Obituaries <0|1> (defecto = 1)
	Dibuja los obituarios en la consola.

ch_Pickupitem <0|1> (defecto = 1)
	Dibuja los íconos y mensajes cuando se toma un ítem.

ch_StatusbarFormat <0|1> (defecto = 10)
         0 - Usara la  Barra de estado de id por defecto.
         1 - Usara la Barra de estado por defecto del OSP, que solo
 	       mostrará munición, armas, salud, flagcarrier y armadura.
         2 - Lo mismo que 1, pero en adición muestra un grafico de
 		 municiones por arma.
         3 - Lo mismo que 1, pero en adición muestra un grafico de
 		 municiones por arma como números.
         4 - Estilo CPM hud (como vq3)
         5 - Barras CPM de salud/armadura
         6 - estilo 3 CPM 
         7 - estilo 4 CPM 
         8 - estilo 5 CPM 
         9 - estilo 1 Q3Comp 
        10 - estilo 2 Q3Comp 
        11 - estilo 3 Q3Comp 
        12 - estilo 4 Q3Comp 

ch_TeamBackground <0|1> (default = 0)
	Deshabilita el fondo del team en la barra de estado y chat del
 	equipo.

ch_TeamchatOnly <0|1> (default = 0)
	Si se habilita , solo dibujara el team chat en la parte
 	inferior izquierda del HUD. 

ch_TeamCrosshairHealth <0|1> (default = 1)
	Si se activa, dibuja la salud y armadura de los jugadores del
  	mismo equipo debajo de la mira.

ch_Teamoverlay <string> (default = "p12n h/aw l")
	Específica que items van a ser mostrado en el teamoverlay. Esto
 	se puede acomodar:
	
	Campos
	=======
	p - iconos de powerup ,a la izquierda
	12n - Acho del nombre del jugador.
	h - Salud del Jugador
	a - Armadura del Jugador
	w - Icono de la Arma 
	l - Locación del Jugador 

	Todos los otros ítems que no se pueden agregar, serán
 	insertados entre medio del campo del jugador (ej. ' ' y '/').

ch_Weaponswitch <0-9> (defecto = 2)
	Valores
	=======
	0 - Estilo antiguo, Horizontal arriba del teamchat
	1 - Lo mismo que  0, Pero permanente
	2 - Vertical, Dibujado a lado derecho del HUD
	3 - Lo mismo que 2,Pero Permanente
	4 - Vertical, Dibujado al lado izquierdo del Hud.
	5 - Lo mismo que 4, Pero permanente y muestra el ammo de cada
 	    arma.
      6 - Estilo CPM Izquierdo
      7 - Estilo CPM Derecho
      8 - Estilo CPM Abajo
	9 - No muestra el cambio de arma (si tu no lo necesitas o si
 	    estas usando statusbarformat 2 o 3)



Opciones de la fuente del cliente (require cg_enableOSPHUD seteado a 1):
=========================================================================
Nota: Las letras son seteadas especificando el ancho y largo de caracteres
como deberían aparecer. Como por ejemplo: set cf_Statusbar "24x48".
Esto dejara que cada carácter o icono en la barra de estado sea de 24 
pixeles de ancho y 48 de alto.

cf_AmmoStatusbar <XxY> (default = 8x8)
	Dimensiones de la fuente mostrados con ch_statusbarFormat 2 o
 	3.

cf_CrosshairNames <XxY> (default = 16x16)
        Tamaño de las Crosshairnames .

cf_Following <XxY> (default = 12x12)
	Tamaño de fuente del Mensaje que sigue.

cf_Fragmsg <XxY> (default = 16x16)
	Tamaño de la fuente del mensaje de "You Fragged xxx".

cf_Scores <XxY> (default = 16x16)
	Tamaño de la fuente de la caja de puntaje en la parte inferior
 	derecha del HUD.

cf_Pickupstring <XxY> (default = 16x16)
	Tamaño de la fuente del texto del ítem tomado.

cf_Statusbar <XxY> (default = 48x48)
	Agranda o achica la barra de status si ch_statusbar esta en 1.

cf_Teamchat <XxY> (default = 6x16)
	Tamaño de fuente del teamchat.

cf_TeamCrosshairHealth <XxY> (default = 12x12)
	Tamaño de la fuente de la información de vida de la mira.

cf_Teamoverlay <XxY> (default = 7x17)
	Tamaño de la fuente del team overlay.

cf_Vote <XxY> (default = 12x12)
	Tamaño de la fuente del mensaje de votación.

cf_WeaponName <XxY> (default = 12x12)
	Tamaño de la fuente de nombre del arma si ch_weaponswitch es 1.

cf_WeaponSwitch <XxY> (default = 32x32)
	Tamaño de la fuente de los gráficos del weaponswitch.


=============================
Seteos útiles para el Cliente
=============================
Los clientes puede setear:

	set cg_predictItems 0

Para evitar acciones inesperadas y sonidos de "pickup" que pueden ocurrir
 aveces durante el período de "warmup" (pre-calentamiento).


Usando el gancho:
=================
Si en el server está disponible el gancho, setea:

	bind nombre_tecla +button5

Precionando y manteniendo nombre_tecla (ej. mouse3), tu gancho será lanzado
 y te tirará cuando se enganche en un objeto. Para soltar el gancho, solo
 suelta nombre_tecla.


Tirando Items:
===============
Si está configurado (o fue votado), los jugadores pueden tirar armas/municiones
 en TDM o CTF. El comando para tirar items es:

	\drop <nombre_item>

<nombre_item> puede ser cualquiera de los siguientes:

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

Los jugadores pueden opcionalmente tirar las banderas en CTF con el comando:

	\drop flag


Usando el ViewCam:
==================
Hay muchas maneras de usar el viewcam.  Para habilitarlo:
	- Tipea: \viewcam en la consola
	- Unirse: \team vc
	- Ciclo a través de el cuando se está en modo espectador

Este modo de funcionamiento siempre localizará la mayor acción en en el mapa.
 Para moverse manualmente por las diferentes locaciones del viewcam, tipea:

	\vc_free

	----> Esta opción cambia el posicionamiento del viewcam entre
 		manual o automático.

Tu puedes opcionalmente seguir a un solo jugador con este modo:
	\vc_follow

Para seguir a un jugador ESPECIFICO, tipea:
	\vc_follow [JUGADOR_ID|NOMRE_JUGADOR]

	----> Nota: tu puedes solo hacer un ciclo a través de los
 jugadores precionando las teclas de saltar/agachar también.

Las posiciones del viewcam están definidas por un archivo de configuración
que es del mapa en específico. Si el mapa no tiene un archivo que define
el viewcam, el viewcam estará deshabilitado para ser usado en el este mapa.

Crear definiciones de nuevos viewcam es super facil y también entretenido =
) Toda la documentación que necesitaras (+ comandos adicionales) 
está incluida en el archivo Docs/osp-q3-Viewcam.txt.
(Para español: Docs/ESP/osp-q3-Viewcam-ESP.txt).

Si tu haces archivos de definiciones para el viewcam que no estan incluidas
 en la distribución de OSP, por favor mándalos a mi y yo los incluiré en el
 próximo release. Por su puesto, todos los créditos serán mostrados.


Feedback
========
Para comentarios, sugerencias, opciones requeridas, reportes de bugs:
   rhea@OrangeSmoothie.org