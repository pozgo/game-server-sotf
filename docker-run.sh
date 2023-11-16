#!/usr/bin/env bash

docker run --rm -i -t -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp -v $(pwd)/steamcmd:/steamcmd -v $(pwd)/game:/sonsoftheforest --name sons-of-the-forest-dedicated-server polinux/game-server-sotf:latest
