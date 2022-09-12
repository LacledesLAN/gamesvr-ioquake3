### ioQuake3

This docker image and repo uses https://ioquake3.org/


### Demo Vs. Full game server and pak0.pk3

If you want to run all maps on this server you need to provide a copy of pak0.pk3 from a valid copy of quake3. The server will still work but would be limited to the maps that are only availabe on the demo. The only maps on the demo are q3dm1, q3dm7, q3dm17, and q3tourney2.  The game can be easily picked up on [Steam](https://store.steampowered.com/app/2200/Quake_III_Arena/), [GOG](https://www.gog.com/game/quake_iii_arena), and [Microsoft store/gamepass](https://www.xbox.com/en-us/games/store/quake-iii-arena/9nwnls28zg37). 

Because of multiple legal reasons the pak0.pk3 file is not included. The way to include it on the server is to host the file outside the docker container and mount the file into the container. If you put he file in the /q3a-assets/ directory then you add this to your docker launch string.

```
-v ~/q3a-assets/pak0.pk3:/app/baseq3/pak0.pk3
```

### Playlist information

In order to make it make it easier to to manage and keep consistant playlists on game modes, the map playlists are seperated into a seperate file in [playlsits.cfg](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/playlists.cfg).  You will see that each stock map is listed and setup in a setup rotating playlist. Because of how  quake 3 has to do playlists you will see entries like this.
```
set stock-dm-2 "map q3dm2 ; set nextmap vstr stock-dm-3"        // House of Pain
```

In this line a varible being set is  stock-dm-2 which notes that its the second map of the stock deathmatch playlist. In that varible the current map is being set to q3dm2 while the next map is set to the next entry in the list.  Also the the name of q3dm2 is at the end of the entry and is commented out.

Adding the command "+ vstr stock-dm-2" at the end of your launch string or running " vstr stock-dm-2" in the console will also launch the map and keep the playlist going. 


## Linux

### Run Self-Tests

```shell
TODO
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
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game InstaUnlagged +exec DefaultServer-FFA.cfg +exec playlists.cfg +vstr stock-dm-1
```

### Instagib 1v1

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game InstaUnlagged +exec DefaultServer-Tourney.cfg +exec playlists.cfg +vstr stock-1v1-map1
```

### Instagib Capture The Flag

> Currently broken!

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game InstaUnlagged +exec DefaultServer-CTF.cfg +exec playlist.cfg +vstr stock-ctf-1
```

### Instagib Team Deathmatch

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game InstaUnlagged +exec DefaultServer-TeamDm.cfg +exec playlists.cfg +vstr stock-dm-1
```

### Freeze Tag Team Deathmatch

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game osp +exec freezetag.cfg +exec playlists.cfg +vstr stock-dm-1
```

### Rocket Arena

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +set fs_game arena +exec server-arena.cfg +set rconpassword "EXAMPLE"
```

### Using with VR

So in order to support [Quake3quest](http://quake3.quakevr.com/) a [special config](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/server-VR-DM.cfg), [playlist](https://github.com/LacledesLAN/gamesvr-ioquake3/blob/main/dist/app/baseq3/playlists.cfg#L43) and the [Dreamcast Map Pack](https://www.moddb.com/games/quake-iii-arena/addons/dreamcast-map-pack2) are included. The server config is set to automaticly set to display on the Quake3quest server list. The Dreamcast map pack was originally intended to allow crossplay between Dreacmast and PC, however due to the reduced visuals it became popular to the VR community since its easier for the quest 2 to hit that 90 frames per second. It can easily be downloaded on the quest2 using the Quake3quest companion app.

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-ffa-vm.cfg +exec playlists.cfg +vstr dc-dm1 +set rconpassword "EXAMPLE"
```



