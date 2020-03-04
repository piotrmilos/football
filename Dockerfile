FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq git ffmpeg virtualenv libopenmpi-dev openmpi-bin openmpi-common python3-pip

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install cloudpickle gin-config gym neptune-client numpy pylint pylint_quotes pytest randomdict ray tensorflow==2.1.0
RUN python3 -m pip install cloudpickle gin-config gym neptune-client numpy pylint pylint_quotes pytest randomdict ray tensorflow==2.1.0
RUN python3 -m pip install -e git+https://gitlab.com/awarelab/gym-sokoban.git#egg=gym-sokoban

RUN python3 -m pip install attrs ipdb tqdm mpi4py

RUN python3 -m pip install git+git://github.com/deepmind/bsuite.git

RUN python3 -m pip install git+https://gitlab.com/awarelab/mrunner.git

RUN apt-get -y install cmake build-essential libgl1-mesa-dev libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev libboost-all-dev libdirectfb-dev libst-dev mesa-utils xvfb x11vnc libsdl-sge-dev

RUN python3 -m pip install git+https://github.com/piotrmilos/football.git
RUN python3 -m pip install git+https://github.com/openai/baselines.git
RUN python3 -m pip install ray[rllib]
RUN python3 -m pip install psutil
RUN git clone https://github.com/piotrmilos/football.git

WORKDIR '/root'
