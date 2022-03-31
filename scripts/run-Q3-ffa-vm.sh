#!/bin/sh
echo "Edit this script to change the path to ioquake3's dedicated server executable and which binary if you aren't on x86_64.\n Set the sv_dlURL setting to a url like http://yoursite.com/ioquake3_path for ioquake3 clients to download extra data"
echo "Make sure fastDL is enabled"

~/ioquake3/ioq3ded.x86_64 +exec server-ffa-vm.cfg +exec playlists.cfg +vstr dc-dm1 +set rconpassword "EXAMPLE"
