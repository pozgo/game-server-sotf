FROM polinux/debian-wine:latest

ENV WINEPREFIX=/winedata/WINE64 \
    WINEARCH=win64 \
    DISPLAY=:1.0 \
    TIMEZONE=Europe/Warsaw \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0 \
    ALWAYS_UPDATE_ON_START=1 \
    USERDATA_PATH=/sonsoftheforest/userdata

VOLUME ["/sonsoftheforest", "/steamcmd", "/winedata"]

EXPOSE 8766/udp 27016/udp 9700/udp 

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        lib32gcc-s1 \
        nano \
        winbind \
        xvfb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . ./

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone && \
    chmod +x /usr/bin/steamcmdinstaller.sh /usr/bin/servermanager.sh

CMD ["servermanager.sh"]
