# Transmission GUI, a Docker container with noVNC http access
This container allows you to have a working Transmission GUI app, reachable via a http noVNC that can be placed behind a reverse proxy.

More information about the noVNC baseimage here : https://github.com/jlesage/docker-baseimage-gui.

Basically, here is a docker-compose exmaple of how to use it :
```
version: '2'
services:
  trgui:
    image: acaranta/docker-tranguihttp
    environment:
      - VNC_PASSWORD=<yourVNCpassword>
    volumes:
      - <yourdockervolume>:/app/config:rw
    ports:
      - 5800:5800
```

