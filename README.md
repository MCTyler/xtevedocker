![alt text](https://github.com/MCTyler/xtevedocker/blob/master/xteve.png)    
# xtevedocker for Linux Ubuntu/Windows Docker (Linux Containers) (Editable Version) 1.4.X
https://cloud.docker.com/u/eodcrafter/repository/docker/eodcrafter/xteve
https://github.com/MCTyler/xtevedocker/archive/master.zip
# If you would like your own version of xTeVe, just replace the Binary with your own. Be sure it's Linux Version!
https://xteve.de/
# Edit the Run Script to Suit your Needs for Port.
# To Build this Volume, Download Repo Zip, and run:

`docker build /path/to/extracted/repo`

# This Docker Container can bun run with the following command:
```bash
docker run -it --network host --restart always --name xtevedock -v ~/xtevedock/tmp:/tmp/xteve/ -v ~/xtevedock/files:/root/xteve/ *********
******** `eodcrafter/xteve or 1st 4 #'s of Build you just made`
```
# Extra Info that may be Useful....
Local Path will now be `/root/xteve/data/` or `/root/xteve/` as specified in the Docker Run Command.

Actual Path is `~/xtevedock/data` or `~/xtevedock/files` respectfully.

This section contains optional procedures for configuring Linux hosts to work better with Docker.

Manage Docker as a non-root user
The Docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user root and other users can only access it using sudo. The Docker daemon always runs as the root user.

If you don’t want to preface the docker command with sudo, create a Unix group called docker and add users to it. When the Docker daemon starts, it creates a Unix socket accessible by members of the docker group.

Warning

The docker group grants privileges equivalent to the root user. For details on how this impacts security in your system, see Docker Daemon Attack Surface.

To create the docker group and add your user:

Create the docker group.

```$ sudo groupadd docker```

Add your user to the docker group.

```$ sudo usermod -aG docker $USER```

Completely REBOOT System!!!! Logging out and Back on is not sufficient.

If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.

Verify that you can run docker commands without sudo.

```$ docker run hello-world```

This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

If you initially ran Docker CLI commands using sudo before adding your user to the docker group, you may see the following error, which indicates that your ~/.docker/ directory was created with incorrect permissions due to the sudo commands.

WARNING: Error loading config file: /home/user/.docker/config.json -
stat /home/user/.docker/config.json: permission denied
To fix this problem, either remove the ~/.docker/ directory (it is recreated automatically, but any custom settings are lost), or change its ownership and permissions using the following commands:

```$ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R```
```$ sudo chmod g+rwx "$HOME/.docker" -R```

Configure Docker to start on boot
Most current Linux distributions (RHEL, CentOS, Fedora, Ubuntu 16.04 and higher) use systemd to manage which services start when the system boots. Ubuntu 14.10 and below use upstart.

systemd

```$ sudo systemctl enable docker```

To disable this behavior, use disable instead.

```$ sudo systemctl disable docker```

If you need to add an HTTP Proxy, set a different directory or partition for the Docker runtime files, or make other customizations, see customize your systemd Docker daemon options.

upstart
Docker is automatically configured to start on boot using upstart. To disable this behavior, use the following command:

```$ echo manual | sudo tee /etc/init/docker.override```

chkconfig

```$ sudo chkconfig docker on```

# M3U Grab Script
Used to seperate m3u into the groups it contains

```bash
    #!/bin/sh
    #M3U Grab
    cd ~/xtevedock/files/
    wget "http://go.great.IPTV/get.php?username=***********@gmail.com&password=**********&type=m3u_plus&output=mpegts" -O iptv_download.m3u
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
wget "http://********/get.php?username=**********@gmail.com&password=***********&type=m3u_plus&output=mpegts" -O iptv_download.m3u
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
