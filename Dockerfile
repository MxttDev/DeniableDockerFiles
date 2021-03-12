# Minecraft Spigot 16.5

FROM java:8

ENV PORT 25570

# DOWNOAD SHIT
RUN apt-get clean
RUN apt-get install unzip


# SORTS OUT FILES
COPY spigot.yml /tmp/spigot.yml
COPY ops.json /tmp/ops.json
COPY start.sh /start.sh

COPY /plugins/DeniableLobby.jar /tmp/plugins/DeniableLobby.jar
COPY /plugins/LuckPerms.jar /tmp/plugins/LuckPerms.jar
COPY /plugins/Vault.jar /tmp/plugins/Vault.jar

COPY ./plugins/Lobby/. /tmp/plugins/Lobby
COPY ./plugins/LuckPerms/. /tmp/plugins/LuckPerms
RUN chmod 755 /start.sh

# USER MANAGEMENT
RUN useradd -d /data -s /bin/bash --uid 1000 minecraft

# EXPOSES IP + SETS DIRECTORIES
VOLUME ["/data"]/
WORKDIR /data
EXPOSE $PORT

# STARTS CMD
ENTRYPOINT [ "sh", "/start.sh" ] 
