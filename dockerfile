FROM idaholab/moose:latest


LABEL Name=pert Version=0.0.1

WORKDIR /opt

RUN git clone -b main https://github.com/gabburgio/pert.git ; \
cd pert ; \
git submodule update --init ; \
make -j $(grep -c ^processor /proc/cpuinfo)
