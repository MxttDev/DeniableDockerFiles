#!/bin/bash

echo "Downloading files.."
# Installer
if [ ! -e /data/server.jar ]; then
	wget -q -O /data/server.jar https://www.dropbox.com/s/o2h4fozyd6ld6m7/server.jar?dl=1
	chmod 755 /data/server.jar
fi

# Sets spigot shit out
if [ ! -e /data/spigot.yml ]; then
	cp /tmp/spigot.yml /data/spigot.yml
fi

if [ ! -e /data/ops.json ]; then
	cp /tmp/ops.json /data/ops.json
fi

if [ ! -e /data/server.properties ]; then
	wget -q -O /data/server.properties https://www.dropbox.com/s/4cr2nd1l6236e71/server.properties?dl=1
	echo "server-port=$PORT" >> /data/server.properties
	echo "online-mode=false" >> /data/server.properties
fi

if [ ! -e /data/world ]; then
	wget -q -O /data/world.zip https://www.dropbox.com/s/79kn0mhzc3p85h2/world.zip?dl=1
	unzip world.zip -d /data/
fi

if [ ! -e /data/plugins/DeniableLobby.jar ]; then
	mkdir /data/plugins
	mkdir /data/plugins/Lobby
	mkdir /data/plugins/LuckPerms
	cp /tmp/plugins/DeniableLobby.jar /data/plugins/DeniableLobby.jar
	cp /tmp/plugins/LuckPerms.jar /data/plugins/LuckPerms.jar
	cp /tmp/plugins/Vault.jar /data/plugins/Vault.jar

	cp /tmp/plugins/Lobby/* /data/plugins/Lobby
	cp /tmp/plugins/LuckPerms/* /data/plugins/LuckPerms
fi


# Change server files
echo "eula=true" > eula.txt

# Setup owner
chown -R minecraft:minecraft /data

java -DIReallyKnowWhatIAmDoingISwear -Xmx2G -jar server.jar nogui

bash
