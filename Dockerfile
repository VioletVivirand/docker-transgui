FROM jlesage/baseimage-gui:ubuntu-18.04

ENV TRANSGUI_VERSION=5.18.0
ENV ENABLE_CJK_FONT=1

# Install necessary dependencies
RUN apt-get update && \
  apt-get install -y libgtkextra-dev libssl-dev && \
  rm -rf /var/lib/apt/lists/*

# Get Transmission-Remote-GUI
RUN mkdir /app
WORKDIR /app
ADD https://github.com/transmission-remote-gui/transgui/releases/download/v${TRANSGUI_VERSION}/transgui-${TRANSGUI_VERSION}-x86_64-Linux.txz /app/transgui.txz
RUN tar -xvf transgui.txz && rm -rf transgui.txz

# Create a directory for Transmission-Remote-GUI
RUN mkdir /config/transgui

# Fix docker-baseimage-gui/issues/51
RUN sed -i "/messagebus/d" /var/lib/dpkg/statoverride

ADD startapp.sh /startapp.sh

RUN APP_ICON_URL=file:///app/transgui.png && install_app_icon.sh "$APP_ICON_URL"

EXPOSE 5800
EXPOSE 5900

VOLUME /config

ENV APP_NAME="Transmission Remote GUI"
