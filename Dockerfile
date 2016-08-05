FROM resin/rpi-raspbian:jessie
MAINTAINER RajR

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  lxde-core lxterminal lxappearance lightdm \
  xterm xfonts-base \
  tightvncserver \
  vim wget \
 --no-install-recommends 

#install a couple of web-browsers
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  lynx \
  luakit \
  epiphany-browser cgroup-bin libraspberrypi0 libwayland-client0 libwayland-cursor0 libwayland-server0 \
 --no-install-recommends

RUN \
    rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Expose ports.
EXPOSE 5900 5901 5902

# Define default command.
CMD USER=root vncserver :0 -geometry 1280x800 -depth 24  && tail -F /root/.vnc/*.log

########### To RUN ##########
# docker run --rm -it --name desktop -p 6901:5900 desktop2-w-browser bash -c "USER=root vncserver :0 -geometry 1280x800 -depth 24  && tail -F /root/.vnc/*.log" 
