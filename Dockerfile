FROM ubuntu:22.04

RUN apt-get update; apt-get install -y -q iverilog python3 python3-pip gcc-riscv64-unknown-elf meson git libgl1 zip make sudo
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r tmp/requirements.txt && rm /tmp/requirements.txt

RUN mkdir -p /opt
# COPY efinity-2023.2.307-ubuntu-x64.tar.bz2 /tmp
# RUN cd /opt; tar -jxf /tmp/efinity-2023.2.307-ubuntu-x64.tar.bz2 && rm /tmp/efinity-2023.2.307-ubuntu-x64.tar.bz2

ENV LITEX_ENV_EFINITY /opt/efinity/2023.2
ENV EFINITY_HOME /opt/efinity/2023.2

# COPY efinity-2023.2.307.5.10-ubuntu-x64-patch.zip /tmp
# RUN cd /tmp && cd /tmp && unzip efinity-2023.2.307.5.10-ubuntu-x64-patch.zip && cd efinity-2023.2.307.5.10-ubuntu-x64-patch && EFINITY_HOME=/opt/efinity/2023.2 ./run.sh --silent && rm -fr /tmp/efinity*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
