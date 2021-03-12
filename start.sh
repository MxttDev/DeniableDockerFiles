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

if [ ! -e /data/server.properties ]; then
	wget -q -O /data/server.properties https://www.dropbox.com/s/4cr2nd1l6236e71/server.properties?dl=1
fi

# Change server files
echo "eula=true" > eula.txt
echo "server-port=$PORT" > server.properties

# Setup owner
chown -R minecraft:minecraft /data

java -DIReallyKnowWhatIAmDoingISwear -Xmx2G -jar server.jar nogui

bash
