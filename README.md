# rpi-raspbian-desktop

# TO BUILD
docker build -t rajr/rpi-raspbian-desktop . 

# TO RUN
docker run --rm -it --name desktop -p 6901:5900 rajr/rpi-raspbian-desktop bash -c "USER=root vncserver :0 -geometry 1280x800 -depth 24  && tail -F /root/.vnc/*.log" 

vncviewer rpi-ip:5900
