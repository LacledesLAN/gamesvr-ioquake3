# Quake 3 Arena Dedicated Server in Docker

![Quake 3 Arena Screenshot](https://raw.githubusercontent.com/LacledesLAN/gamesvr-ioquake3/master/.misc/screenshot.jpg "Quake 3 Arena
Screenshot")

## IOQuake3

This docker image uses [IOQuake3](https://ioquake3.org/) for the server binary. It also includes [OSP mod](https://www.orangesmoothie.org)
and [Rocker Arena](https://www.moddb.com/mods/rocket-arena-3).

## Demo Vs. Full Game Server

By default, this server will only work the maps that were shipped with the public Quake 3 demo (q3dm1, q3dm7, q3dm17, and q3tourney2). To
run a Quake 3 server that includes all maps, you will need to provide a legal copy of `pak0.pk3` from the retail version of Quake 3. Quake 3
can be easily picked up on [Steam](https://store.steampowered.com/app/2200/Quake_III_Arena/),
[GOG](https://www.gog.com/game/quake_iii_arena), and the [Microsoft
Store / Gamepass](https://www.xbox.com/en-us/games/store/quake-iii-arena/9nwnls28zg37). For legal reasons this `pak0.pk3` is not distributed
with this Docker image.

To provide a `pak0.pk3`, simply use a [Docker volume](https://docs.docker.com/storage/volumes/) to mount it inside the running container.

```shell
-v /local/path/to/pak0.pk3:/app/baseq3/pak0.pk3
```

## Playlist information

This server separates playlist to keep game modes easier to manage via a chain of cvars, configured via
[playlists.cfg](./dist/app/baseq3/playlists.cfg). It groups *like*-maps in rotating playlists. For example:

```text
set stock-dm-2 "map q3dm2 ; set nextmap vstr stock-dm-3"        // House of Pain
```

On this configuration line the cvar `stock-dm-2` will load map `q3dm2` and queue up the cvar `stock-dm-3` to be executed afterwards. To
start a server using the map `q3dm2`, add the command `+vstr stock-dm-2` to the end of your launch string, this will keep the playlist intact.

## Using with VR

This server supports [Quake3quest](http://quake3.quakevr.com/), by providing [specific config file](./dist/app/baseq3/server-VR-DM.cfg),
a custom [playlist](./dist/app/baseq3/playlists.cfg#L43), and the [Dreamcast Map
Pack](https://www.moddb.com/games/quake-iii-arena/addons/dreamcast-map-pack2). The Dreamcast map pack was originally intended to allow
cross-play between Dreamcast and PC, however due to the reduced visuals it became popular to the VR community since its easier for the quest
2 to hit that 90 frames per second. It can easily be downloaded on the quest2 using the [Quake3quest](http://quake3.quakevr.com/) companion
app.

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-ffa-vm.cfg +exec playlists.cfg +vstr dc-dm1 +set rconpassword "EXAMPLE"
```

## Linux

[![Update Docker Hub Description](https://github.com/LacledesLAN/gamesvr-ioquake3/actions/workflows/update-dockerhub.yml/badge.svg)](https://github.com/LacledesLAN/gamesvr-ioquake3/actions/workflows/update-dockerhub.yml)

### Run Self-Tests

```shell
docker run -it --rm lacledeslan/gamesvr-ioquake3 ./ll-tests/gamesvr-quake3.sh;
```

### Run Simple Interactive Server (Free For All Deathmatch)

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-ffa.cfg +exec playlists.cfg +vstr stock-dm-1 +set rconpassword "EXAMPLE"
```

### Capture the Flag

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-ctf.cfg +exec playlists.cfg +vstr stock-ctf-1 set rconpassword "EXAMPLE"
```

### Team deathmatch

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-tdm.cfg +set rconpassword "EXAMPLE" +exec playlists.cfg +vstr stock-dm-1
```

### Instagib (Free For All Deathmatch)

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64  +set fs_game osp +exec ffa-instagib.cfg +exec playlists.cfg +vstr stock-dm-1
```

### Instagib 1v1

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64  +set fs_game osp +exec 1v1-instagib.cfg +exec playlists.cfg +vstr stock-1v1-map1
```

### Instagib Capture The Flag

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64  +set fs_game osp +exec ctf-instagib.cfg +exec playlist.cfg +vstr stock-ctf-1
```

### Instagib Team Deathmatch

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64  +set fs_game osp +exec team.cfg +exec playlists.cfg +vstr stock-dm-1
```

### Freeze Tag Team Deathmatch

```shell
docker run -d --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game osp +exec freezetag.cfg +exec playlists.cfg +vstr stock-dm-1
```
