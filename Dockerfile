FROM idaholab/moose:latest

WORKDIR /opt

RUN git clone -b main https://github.com/gabburgio/pert.git ; \
cd pert ; \
git submodule update --init ; \
make 

WORKDIR /opt/pert