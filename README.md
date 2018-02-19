PiXploitHost
============

**Spanish guide** 

**La guía en español la puedes ver en elotrolado.net**

https://www.elotrolado.net/hilo_pixploithost-servidor-de-exploits-y-bloqueo-de-actualizaciones-en-una-raspberry-pi_2273155#p1745359498

Use your Raspberry Pi (any model) to host console exploits and protect it against undesired FW upgrades.

All this is made on a Pi with Raspbian Jessie with static IP address on local network. Instead of setting a static IP address on your Pi, you can add a static lease in your router. Both are fine, you just need the Pi to have the same IP all the time.

I wrote the guide after i set it all up on an already set up Raspbian Jessie based home server, hopefully i didn't forget any step, or missed installing any needed package. Report any error, and i will double check.

Please, note i'm using the user pi by default. Probably not the best idea since it can be sudoed, so feel free to modify this yourself if login in with another user. Not exposing any services to the internet, so it should be fine tho.

All commands are run from terminal.

This is WIP... only PS4 exploits added for now.

Installing DNSmasq DNS server
-----------------------------

Install DNSmasq DNS server:

	sudo apt-get install dnsmasq

Add forged DNS entries:	
	
	sudo nano /etc/dnsmasq.conf
	
Add the following lines to the end of the file (replace **YOUR_RASPBERRY_PI_STATIC_IP** with your RPi static IP address):

	# Wii U Update Blocker

	address=/nus.cdn.shop.wii.com/127.0.0.1
	address=/nus.cdn.wup.shop.nintendo.net/127.0.0.1
	address=/nus.wup.shop.nintendo.net/127.0.0.1
	address=/nus.c.shop.nintendowifi.net/127.0.0.1


	# PS4 Update Blocker

	address=/manuals.playstation.net/**YOUR_RASPBERRY_PI_STATIC_IP**
	address=/.net.playstation.net/**YOUR_RASPBERRY_PI_STATIC_IP**
	address=/.ps4.update.playstation.net/**YOUR_RASPBERRY_PI_STATIC_IP**
	address=/gs2.ww.prod.dl.playstation.net/**YOUR_RASPBERRY_PI_STATIC_IP**
	address=/.207.net/127.0.0.1
	address=/.akadns.net/127.0.0.1
	address=/.akamai.net/127.0.0.1
	address=/.akamaiedge.net/127.0.0.1
	address=/.cddbp.net/127.0.0.1
	address=/.ea.com/127.0.0.1
	address=/.edgekey.net/127.0.0.1
	address=/.edgesuite.net/127.0.0.1
	address=/.llnwd.net/127.0.0.1
	address=/.playstation.com/127.0.0.1
	address=/.playstation.net/127.0.0.1
	address=/.playstation.org/127.0.0.1
	address=/.ribob01.net/127.0.0.1
	address=/.sbdnpd.com/127.0.0.1
	address=/.scea.com/127.0.0.1
	address=/.sonyentertainmentnetwork.com/127.0.0.1
	
	
Control X to exit nano, then Y + intro to save.

Restart service:

	sudo service dnsmasq start

Check it is working properly. If you ping any of the above domains, result should be the IP we added to the conf file. Make sure it works!

	ping www.google.com
	
	PING www.google.com (172.217.19.132) 56(84) bytes of data.
	64 bytes from par03s12-in-f132.1e100.net (172.217.19.132): icmp_seq=1 ttl=53 time=18.9 ms
	
	ping manuals.playstation.net
	PING manuals.playstation.net (**YOUR_RASPBERRY_PI_STATIC_IP**) 56(84) bytes of data.
	64 bytes from **YOUR_RASPBERRY_PI_STATIC_IP**: icmp_seq=1 ttl=64 time=0.065 ms
	
	ping www.sonyentertainmentnetwork.com
	
	PING www.sonyentertainmentnetwork.com (**127.0.0.1**) 56(84) bytes of data.
	64 bytes from localhost (**127.0.0.1**): icmp_seq=1 ttl=64 time=0.061 ms
	

Installing and configuring Apache web server
--------------------------------------------

Install Apache web server

	sudo apt-get install apache2 -y

Set user pi permissions

	sudo chown -R pi:www-data /var/www
	sudo chmod u+rxw,g+rx-w,o-rwx /var/www
	sudo chmod g+s /var/www


Add a redirect rule in var/www/html/.htaccess file

	nano /var/www/html/.htaccess

Place this text in the file. 	
	
	RedirectMatch 301 /document/[a-z]{2}/ps4(.*) $1

Control X to exit nano, then Y + intro to save.
	
Edit apache2.conf file to allow redirections:
	
	sudo nano /etc/apache2/apache2.conf
	
Find

	<Directory /var/www/>
		...
	</Directory>

Edit like this:

	<Directory /var/www/>
			Options Indexes FollowSymLinks
			AllowOverride All
			Require all granted
	</Directory>

Control X to exit nano, then Y + intro to save.
	
Restart Apache to apply changes:

	sudo service apache2 restart


You can check if Apache is working by accessing http://YOUR_PI_IP from a browser in aany computer in your network.
	

Cloning this repository
----------------------

First, install git.

	cd ~	
	sudo apt-get install -y git dialog

Now, clone the repo and exploit submodules.
	
    git clone https://github.com/c0d3m4st4/PiXploitHost.git
    cd PiXploitHost
    git submodule init
    git submodule update
	
	
Moving exploit host files to host directory
-------------------------------------------

Run these commands in PiXploitHost directory.

	sudo chmod +x moveFiles.sh
    ./moveFiles.sh
	cd ..
	rm -rf PiXploitHost

Please, note this will move all files to default Apache2 document root in /var/www/

If your document root points somewhere else, you will need to make the necessary changes in the script and server config.


Final steps on your PS4
-----------------------

- Disable automatic updates (Top menu - Settings - System - Automatic downloads - DISABLE ALL)
- Network configuration (Top menu - Settings - Network - Set up internet connection - Use cable (or WiFi if that's your case) - Custom - Manual IP address - Manual DNS settings - Primary DNS: **YOUR_RASPBERRY_PI_STATIC_IP** - Scondary DNS: 0.0.0.0 - Automatic MTU - Do not use proxy)

- And that's it. Now if you go to Top menu - Settings - User guide, it should open your new host instead, and you can easily run the exploits.

Credits
-------

All icons made by Freepik (www.freepik.com) from www.flaticon.com

Exploits code

- [xvortex](https://github.com/xvortex)
- [idc](https://github.com/idc)
- [LightningMods](https://github.com/LightningMods)
- [Specter](https://github.com/Cryptogenic)
 