# IOQuake 3 In Docker

TODO: demo mode vs full version
TODO: playlist setup

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

TODO: Bean to fill this section out

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-ioquake3 /app/ioq3ded.x86_64 +exec server-ffa-vm.cfg +exec playlists.cfg +vstr dc-dm1 +set rconpassword "EXAMPLE"
```
