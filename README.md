![alt text](https://github.com/MCTyler/xtevedocker/blob/master/xteve.png)    
# xtevedocker for Linux Ubuntu/Windows Docker (Linux Containers) (Editable Version) 1.3.X
https://github.com/MCTyler/xtevedocker/archive/master.zip
# If you would like your own version of xTeVe, just replace the Binary with your own.
https://xteve.de/
# Edit the Run Script to Suit your Needs for Port.
# To Build this Volume, Download Repo Zip, and run:

`docker build /path/to/extracted/repo`

# This Docker Container can bun run with the following command:
```bash
docker run -it -p 8097:8097 --restart always --name xtevedock -v ~/xtevedock/files:/root/xteve/ 
-v ~/xtevedock/data:/root/xteve/data/ *********
******** `eodcrafter/xteve or 1st 4 #'s of Build you just made`
```
# M3U Grab Script
Used to seperate m3u into the groups it contains

```bash
    #!/bin/sh
    #M3U Grab
    cd ~/xtevedock/files/
    wget "http://go.great.IPTV/get.php?username=***********@gmail.com&password=**********&type=m3u_plus&output=hls" -O iptv_download.m3u
    for i in "Sports" "News" "Movies" "General Streams" "Documentaries" "Kids" "Regional Locals" "Mini Series" "Music" "NCAAF" "NETFLIX  (series)" "NFL" "RADIO" "VOD - Action" "VOD - Animation" "VOD -  BOX SET" "VOD - Comedy" "VOD - Drama + Crime" "VOD - Family" "VOD - Horror" "VOD - KIDS TV" "VOD - Fantasy - SciFi" "Star Trek TNG (series)" "VOD - Superheroes" "VOD - Western"
    do
    <iptv_download.m3u grep --no-group-separator -A1 'group-title="'"$i"\" >"$i.m3u"
    sed -i '1i #EXTM3U' "$i.m3u"
    done
```

# Add Channel Number Script

```bash
#!/bin/sh
: > emby_iptv.m3u
wget "http://********/get.php?username=**********@gmail.com&password=***********&type=m3u_plus&output=hls" -O iptv_download.m3u
while read -r LINE || [ -n "$LINE" ]; do
	awk '/#EXTINF:-1/ {gsub(/EXTINF:-1/, "& tvg-chno=\"" ++channel "\"")} 1' >> emby_iptv_tmp.m3u
done < iptv_download.m3u
mv emby_iptv_tmp.m3u emby_iptv.m3u
rm iptv_download.m3u
```
# Guide Info Help
    Just log into zap2it, configure your guide, and use this script to download guide info.....
```bash
    ./zap2xml.pl -I -O -u *********@gmail.com -p ******** -U UTF-8 -o xmltv.xml
```
```bat
C:\Windows\System32\cmd.exe /c "C:\Users\Steve.steve-PC\Documents\TVGuide\zap2xml.exe -I -O -u ***********@gmail.com -p ********** -U UTF-8 -o xmltv.xml"
```
![alt text](https://github.com/MCTyler/xtevedocker/blob/master/logo.png)    

# https://tvlistings.zap2it.com/
    Find local TV listings for your local broadcast, cable and satellite providers and watch full episodes of your favorite TV shows online.

# http://www.xmltv.co.uk/feeds
    XMLTV publish for the UK, TV listings to supply DVB headends, media centers and PVR's

![alt text](https://github.com/MCTyler/xtevedocker/blob/master/koditv.png)

# https://koditvepg.com/epgs/
    We are focused on delivering high-class quality, accurate and comprehensive metadata and EPG services to many platforms worldwide
