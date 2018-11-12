# xtevedocker for Linux Ubuntu (Editable Version) 1.2.1
https://github.com/MCTyler/xtevedocker/archive/master.zip
# If you would like your own version of XTeVe, just replace the Binary with your own.
# Edit the Run Script to Suit your Needs for Port.
# To Build this Volume, Download Repo Zip, and run:

`docker build /path/to/extracted/repo`

# This Docker Container can bun run with the following command:

`docker run -it --network host --restart always --name xtevedock -v ~/xtevedock/tmp:/tmp/xteve/ -v ~/xtevedock/files:/root/xteve/` {first 4 #'s of the Build you just made}

# M3U Grab Script
Used to seperate m3u into the groups it contains

`#!/bin/sh
#M3U Grab
cd /home/steve/xtevedock/files/
wget "http://go.great.IPTV/get.php?username=***********@gmail.com&password=**********&type=m3u_plus&output=hls" -O iptv_download.m3u
for i in "Sports" "News" "Movies" "General Streams" "Documentaries" "Kids" "Regional Locals" "Mini Series" "Music" "NCAAF" "NETFLIX  (series)" "NFL" "RADIO" "VOD - Action" "VOD - Animation" "VOD -  BOX SET" "VOD - Comedy" "VOD - Drama + Crime" "VOD - Family" "VOD - Horror" "VOD - KIDS TV" "VOD - Fantasy - SciFi" "Star Trek TNG (series)" "VOD - Superheroes" "VOD - Western"
do
  <iptv_download.m3u grep --no-group-separator -A1 'group-title="'"$i"\" >"$i.m3u"
  sed -i '1i #EXTM3U' "$i.m3u"
done`
