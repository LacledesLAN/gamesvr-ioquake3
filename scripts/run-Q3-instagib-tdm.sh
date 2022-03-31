#!/bin/sh
echo "Edit this script to change the path to ioquake3's dedicated server executable and which binary if you aren't on x86_64.\n Set the sv_dlURL setting to a url like http://yoursite.com/ioquake3_path for ioquake3 clients to download extra data"
~/ioquake3/ioq3ded.x86_64 +set fs_game InstaUnlagged +exec DefaultServer-TeamDm.cfg +exec playlists.cfg +vstr stock-dm-1