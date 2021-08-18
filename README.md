# Transmission-Remote-GUI in Docker

This is a Docker container for [Transmission-Remote-GUI](https://github.com/transmission-remote-gui/transgui).

The GUI of the application is accessed through a modern web browser (no installation or configuration needed on the client side) or via any VNC client.

This Docker image is based on [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).

## Usage

Create a directory in `$PWD/config` before executing the following command.

**Option 1**: Launch with Docker CLI

```bash
docker run -itd \
  -e VNC_PASSWORD="<YOUR VNC PASSWORD>" \
  -e KEEP_APP_RUNNING=1 \
  -p 5800:5800 \
  -p 5900:5900 \
  -v $PWD/config:/config:rw \
  --name transgui \
  ghcr.io/violetvivirand/transgui:latest
```

**Option 2**: Launch with Docker Compose

```
version: '3'
services:
  transgui:
    image: ghcr.io/violetvivirand/transgui:latest
    environment:
      - VNC_PASSWORD=<YOUR VNC PASSWORD>
      - KEEP_APP_RUNNING=1
    ports:
      - 5800:5800
      - 5900:5900
    volumes:
      - $PWD/config:/app/config:rw
```

Then:

1. Use browser to visit `<HOST IP ADDRESS>:5800`, or
2. Use VNC client to connect `<HOST IP ADDRESS>:5900`

It may take longer at the first startup because I already turn on the flag to for installing CJK fonts by setting `ENABLE_CJK_FONT=1` when building Docker image. After the installation, it doesn't have to download it again and the time to start the container will be shrinked.

### Other Environment Variables

Please visit [the base image repo and follow its instructions](https://github.com/jlesage/docker-baseimage-gui#environment-variables).