# Minecraft Spigot 16.5

FROM java:8

ENV PORT 25569

# DOWNOAD SHIT
RUN apt-get clean


# SORTS OUT FILES
COPY spigot.yml /tmp/spigot.yml
COPY start.sh /start.sh
RUN chmod 755 /start.sh

# USER MANAGEMENT
RUN useradd -d /data -s /bin/bash --uid 1000 minecraft

# EXPOSES IP + SETS DIRECTORIES
VOLUME ["/data"]/
WORKDIR /data
EXPOSE $PORT

# STARTS CMD
ENTRYPOINT [ "sh", "/start.sh" ] 
