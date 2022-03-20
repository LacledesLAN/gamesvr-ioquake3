OSP Tourney DM/CA/CTF para Quake3
================================
Versión:  1.0
Fecha:    14 Dec 01
Sitio:    http://www.OrangeSmoothie.org
Contacto: rhea@OrangeSmoothie.org

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

--------
Créditos:
--------
Lider del plan/Programador:
	Jason "Rhea" Keimig (rhea@OrangeSmoothie.org)

Programadores adicionales:
	Sander "Dessignator" Brandenburg (dessignator@OrangeSmoothie.org)
	Kevin "arQon" Blenkinsopp (arqon@promode.org)
	Harvey "]R[Papa" Morris (papa@reactivesoftware.com)
	"Khaile" (khaile@www.com)
	Michael "PhaNToM" Billing (phantom@promode.org)
	rest of the CPM staff

Diseñadores del Mappack y todas las relacionadas con los mapas para el release 1.0:
	Christian "SHoD" Farcy (shod@noos.fr)

Diseñadores de mapas:
	Christian "SHoD" Farcy - ospdm1/2/3 - (shod@noos.fr)
	Nicolas "Nunuk" Bouvier - ospdm2 - (nunuk@planetquake.com)
	Benoit "Bal" Stordeur - ospdm3 - (Bal@planetquake.com)
	Todd "Mr.CleaN" Rose - ospdm4 - (mrclean@planetquake.com)
	Scotty "Teddy" Drader - ospdm5 - (sdrader@home.com)
	Ágúst "DruZli" Atlason - ospdm6 - (drusla@simnet.is)
	Jerry "clem" Dent - ospdm7 - (jed@verio.net)
	"JaLisK0" - ospdm8 - (JaLisk0@terra.es)
	"Charon" - ospdm9 - (charon@atlantacon.org)
	"Polo" - ospdm10 - (polo2ro@fragdome.com)
	"Geit" - ospdm11 - (ouwegeit@goat.gamepoint.net)
	Jeremy "random" Eaton - ospdm12 - (jeremy.eaton@telus.net)
	David "SgtGhost" Levesque - ospca1 - (sgtghost@hotmail.com)
	Rich "Publius" Tollerton - ospctf1 - (rtollert@tranquility.net)
	Daniel "Drunken Boxer" Lanicek - ospctf2 - (dlanicek@yahoo.com)

VoodooStats:
	"myrdrin"

Herramienta de configuración del OSP Server:
	"phred"

Constructor del instalador:
	Tim "Gouki" Pearson (gouki@clanavl.com)

Sitio Web de OSP:
	"myrdrin"
	Tim "Gouki" Pearson (gouki@clanavl.com)

*** Esta versión de OSP soporta Quake3 v1.30 
*** y superiores solamente.


Para un poco de aspectos de fondo, OSP Tourney DM esta diseñado 
para facilitar la competencia y hacer mas flexible el juego. 
Este mod simplemente lo hace más fácil y más conveniente para 
jugadores y administradoresy además refuerza la experiencia 
en Quake3.  No ha habido absolutamente ningún cambio a la parte 
central del juego o su dinámica -- todos los valores de Quake3
están por defecto.

Las últimas versiones de OSP (versiones 0.99c y superiores) tienen
Challenge Pro Mode (http://www.challenge-world.com/promode/)
con capacidades integradas!  CPM  es un cambio cuidadoso a varios
aspectos fundamentales de Q3 eso facilita y agiliza el juego
para jugadores y espectadores igualmente.  Compruébalo!  tiene
mucha diversión y agrega un poco de "pimienta" a Quake3.
(Para una lista completa de cambios, revisa el archivo CPM-changes.txt que lo encontrarás en el directorio Docs/).


===============
Partida rápida:
===============
Instala/Descomprime el osp-quake3-<version>.exe/zip en el directorio
principal de Quake3/, con "folders habilitado" (ojo con esto).
Una vez descomprimido debes tener un directorio llamado "osp"  
con todos los archivos listados como se indican en INSTALL.txt.

Para crear un Servidor Dedicado OSP, solo escribe:
--------------------------------------------------
** BORRA el zz-osp-server0.pk3 de tu directorio de OSP. **

(Servidor Ligero)
quake3 +set dedicated 2 +set bot_enable 0 +set fs_game osp +exec <cfg-name>.cfg

(Servidor Pesado)
quake3 +set dedicated 2 +set bot_enable 0 +set fs_game osp +exec <cfg-name>.cfg

----> Para actualizar una versión anterior de OSP:
      Borra TODOS los z-osp-cgameXXX.pk3 en tu carpeta osp/
      Los servidores dedicados deben tener sólo un archivo
      z-osp-cgameXXX.pk3 en el directorio osp/ para prevenir
      downloads de .pk3 innecesarios y confundirse (especialmente
      en servidores basados en Linux/BSD).

----> Si se trata de imitar un server baseq3 (bajo OSP) probablemente 	no puedas, a enos que tu sepas REALMENTE lo que estas haciendo, 	asegurate de BORRAR los archivos incluidos z-osp-cgameXXX.pk3 y 	z-osp-extraXXX.pk3 , junto con setear server_ospauth 0 y 	server_promode 0 si tu NO quieres que los clientes tengan que usar modificaciones de OSP en el lado del cliente. Sin embargo, si tu haces esto, los clientes no estarán capacitados para responder con una autentificación de OSP y cosas como propios HUD, multi-vistas, etc. no trabajarán.

      Para una buena compatibilidad, deja los archivos cgame y extras.pk3 
      en el directorio osp y deja server_ospauth en 1 ,junto con sv_pure en 1).


Para crear un Servidor Listen OSP (donde el cliente y servidor corren
en la misma maquina), solo escribe:
----------------------------------------------------------
quake3 +set fs_game osp +set bot_enable 1 +exec <cfg-name>.cfg

**
** LINUX/BSD admin : Reemplazar "quake3" con "q3ded" en los ejemplos anteriores.
**                   Asegúrate de agregar:
**                        +set fs_basepath <dir> +set fs_cdpath <dir>
**                   eso apunta a al raíz de la carpeta Quake3  y
**                   habilita apropiadamente al servidor que transmite.  Además
**                   agrega     +set vm_game 2 al comando de línea para asegurar
**                   full compatibilidad.
**



========
Detalles
========
Han habido MUCHAS cosas agregadas al Quake3:
- Modo forzado para jugar un match, es decir el jugador debe estar "ready" 
  para empezar el match (en todos los modos de juego).
- Modo extra de juego: "Clan Arena" este es similar en muchos aspectos
  al popular Mod RocketArena para Quake.
- "Challenge Pro Mode" (CPM) sus configuraciones permiten acelerar el juego
  Estas opciones están disponibles bajo todos los tipos del juego
- Altamente configurable por parte del cliente , a través del HUD puedes                         
  modificar la autentificación , auto-demo/screenshot, grabar demos, etc.
- 15 nuevos mapas para todos los modos.
- Estrategias "Voodoo" servidor/cliente "log parser"
- Herramienta de configuración para el servidor OSP
- Multi-view para el espectador.  OSP permite a los espectadores ver a más de un jugador AL MISMO TIEMPO!  incluyendo los sonidos =)
- Modo adicional de espectador: El ViewCam.  Este modo permite ver
  el juego de una manera más cinemática para conseguir una mejor percepción
  de la acción.
- Una extensa estadística del jugador en el juego, esto es único para
  cada modo de juego (FFA, 1v1, Team DM, CTF, y ClanArena).
- Logos (decals) definibles desde el server , estos pueden ponerse a lo largo
  del mapa, en su base. Pueden haber sobre 16 gráficos definibles y 32 en total
  en cualquier mapa.
- Muchos perfeccionamientos del excelente mod Q3Comp.
- Capitán opcional, espectadores que pueden hablar con miembros del equipo, 
  da órdenes como tal, y ve a todos los miembros del equipo para 
  un estilo más realista en el juego.
- Un "filtro" flexible y un mecanismo que permite administrar la negación 
  de acceso a un jugador (banning) basado en su nombre, IP,o password. Además                 
  permite "reservaciones" para jugadores (nombre/ip/password). 
- Un muy avanzado y configurable sistema de votación. 
- El robusto sistema de generación de maplist dinámico se acopló con una rotación 
  de mapas estas capacidades las  puede manejar el jugador y permitirle cambiar el 
  seteo en cualquier server cuando el nuevo mapa se carga.
- Una ventana de estadísticas para una vista rápida del performance del jugador.
- "Modo de configuración" mediante voto, donde los jugadores pueden votar en un 
  servidor, estos modos son apoyados por su propio config del servidor. 
- Capacidad para administración remota con muchos comandos disponibles. 
- Capacidades para el capitán para manejar a su equipo y jugadores.
- Soporte para el color del skin para la cabeza, cuerpo y piernas. Todos pueden ser 
  diferentes! 10 colores disponibles para cada sección.
- Habilidad para los equipos para hacer "lock out" y prevenir que los espectadores 
  sepan su estrategia y usen cheat en la comunicación por Internet4 .
- Habilidad para seguir solo al equipo rojo o azul.
- Servidor automático con datos públicos que se actualizan basándose en el juego, 
  información actual del match como tiempo restante, puntajes de equipos 
  (si está disponible), etc.. todas estas pueden verse en el servidor.
  Cuadro de información de utilidades como GameSpy cuando el servidor se actualiza.
- Capacidades extraordinarias y muy flexibles en el modo overtime (sobre tiempo)
- Se pueden hacer "timeouts" (tiempo fuera) durante el juego, es decir una pausa
  en medio de la acción (solo para capitanes de equipos y referees).
- El gancho es altamente configurable y disponible (opcional). 
- Un completo "banning" (sacar o prohibir) de items y powerup (independiente por mapa).
- Reemplazar items (independiente por mapa).
- Configuración adicional para matches 1v1. Ganar por diferencia de puntaje. Este
  seteo es algo similar al tipo de juego RocketArena 1v1.  
- In-server arreglado de q3tourney3 para juegos en equipo.
- Una especificación configurable del MOTD (Mensaje del día) en el servidor para los 
  clientes.
- Una especificación configurable de la gráfica para los clientes.
- Sacar items (opcional) para TDM/CTF.
- Sistema opcional de armaduras tipo Q2.
- Permite configurar la lightning gun para entregar una mejor sensación
  en el uso bajo condiciones de "lag" (retraso de datos)
- Habilidad para dar armas/municiones a los jugadores en cada respawn.
- Habilidad para especificar el arma de partida para un jugador
- Registro adicional (logging).
- Many bug fixes to the default id game.
- Ruso/Español/Chino documentos traducidos.


=====================
Información adicional
=====================
1. Revisa en la carpeta Docs/ para una completa información de la 
   actualización del Mod (osp-q3-History.txt) y todas las nuevas variables 
   de referencia del servidor y descrito en detalle (osp-q3-Variables. txt). 
   Los comandos disponibles los puedes encontrar en osp-q3-Commands.txt.  
   Las preferencias del cliente las puedes encontrar en osp-q3-ClientReadme.txt.

2. Se han proporcionado configuraciones de servidor de ejemplo para aliviar
   la administración del sistema poniendo un config correcto.
   Simplemente toma uno del configs incluidos para crear matches
   como tu quieras en tu servidor , y modifícalos a tu gusto.


3. Para una lista de todos los comandos para los clientes, escribe:

	/help

   Después de conectarte a un servidor con OSP. 

4. Para una lista de todos los comandos del referee (administración remota)
   escribe:

	/ref  ó  /r_help

   Después de obtener el estado de árbitro.

5. Para una lista de todos los comandos de votación disponibles (callvote) ,
   simplemente escribe:

	/callvote ?

  Se muestra una lista de todas las opciones de votación disponibles.


6. Para ir más allá,  y encontrar la sintaxis actual de uso del voto y una descripción 
   del comando, escribe:

	/callvote <nombre de la opción> ?

   El servidor describirá el formato de la votación para el <nombre de la opción>,
   y  una descripción de lo que controla, y su actual configuración (si es aplicable)
   Por ejemplo (para ver la configuración actual en el server del Quad Damage), escribe:

	/callvote quad ?

   entregará:

	Usage: /callvote quad <0|1>
        Enables/disables Quad Damage powerup availability

      Quad Damage is currently ENABLED 

   Simple, no? =)


===========
Otras cosas
===========
Muchas gracias a a|citizen y a|wiseguy (y todo el abuso al clan para esto) 
por ayudarme y tener correcta las cosas. Revisa esta url http://www.teamabuse.com/

Gracias a Khaile, Hoony, y al grupo CPM que molestó para obtener la fuente y la 
información de ayuda para integrar la funcionalidad CPM en OSP.
Revisa la implementación oficial de CPM  (Challenge ProMode) en 
http://www.promode.org

También tengo que dar las gracias a muchas otras personas que ayudaron
a sacar OSP adelante: Godsmurf, Talita, FiTH-arcane,TrEEcH, Gouki, Olzah, 
y Smegma (ewww). ¡Hay mucha gente! Disculpen si olvido a alguno!

Y a tubesock/Gouki.. chicos, gracias por testear, debugar y sacar las problemas
para llevarlo a la perfección.  Aprecio mucho toda la ayuda  que ustedes me
han proporcionado.

Gracias a ]R[Papa (del famoso q3comp : http://www.reactivesoftware.com) 
y a Strider por la colaboración en los problemas de eventos y sonidos de id.

"Gracias!" a arQon del famoso CPMA (pronto a liberarse).
Gracias por toda la ayuda con el código en los años oscuridad de
la versión 0.99x de OSP ;-)

Mis mas profundos agradecimientos a Strider (Alan Kivlin - akivlin@lineone.net) 
por el parche para del 125hz para el cliente y un par de observaciones 
en el espectador multi-view (como una vista de la bandera en CTF que yo no he
habilitado aún).

Estoy endeudado con Jim Luther (dv8|Fia) y [AVL]Hifi por su ayuda en 
sacar todos los problemas de OSP con el "querido" Macintosh . Estos molestos
Macs.... ;-)

Gracias a Heeler por su ayuda en gráficos targa.  Adobe rocks!

Mucho amor a "alias" del team evolution (http://evolution.clanpages.com)
por el config espectador para ordenar algunas de las nuevas opciones del
espectador multi-view bajo OSP.

Gracias a estos artistas del viewcam:
      SHoD        - ospdm1-11
      [AVL]Gouki  - q3ctf3, q3ctf4, q3wctf1-3, japanctf
      jab         - q3ctf1, q3ctf2
      Olzah       - ztn3dm1
      Rune        - q3tourney2
      SoloRail    - q3dm1-4, q3dm8-12
      TrEEcH      - q3dm13, q3dm17, q3jdm8a
      VK-Hunter   - q3dm14-16,19 q3tourney1,3,5, overkill

Para las preguntas, comentarios, "bugs", o requerimientos, envía 
un email a:

      rhea@OrangeSmoothie.org

Revisa nuestro sitio para las últimas actualizaciones OSP-Q3 en:

      http://www.OrangeSmoothie.org/beta.html

También, revisa el foro en:

      http://www.OrangeSmoothie.org/forum/

Finalmente, también tenemos un canal en IRC, #osp, en EnterTheGame
(irc.enterthegame.com:6667).  Revisa http://www.enterthegame.com
para informarte de los relativos nuevos cambios en servidores IRC.

Gracias por usar OSP,
-Rhea
