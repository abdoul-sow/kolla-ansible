FROM docker:23.0.6-alpine3.17
LABEL vendor="abdoulsow/kolla-ansible" maintainer="ab.sow23@outlook.com" version="1.0.0"

SHELL ["/bin/sh", "-xo", "pipefail", "-c"]

## Install system dependencies
RUN apk add --no-cache --update \
        ansible=8.6.1-r0 \
        bash=5.2.21-r0 \
        coreutils=9.4-r2 \
        curl=8.5.0-r0 \
        file=5.45-r1 \
        gcc=13.2.1_git20231014-r0 \
        gettext=0.22.3-r0 \
        git=2.43.4-r0 \
        g++=13.2.1_git20231014-r0 \
        make=4.4.1-r2 \
        multipath-tools=0.9.7-r1 \
        musl=1.2.4_git20230717-r4 \
        libffi-dev=3.4.4-r3 \
        openssl-dev=3.1.5-r0 \
        unzip=6.0-r14 \
        python3-dev=3.11.9-r0 \
        py3-pip=23.3.1-r0

RUN pip3 install --no-cache-dir -U \
        pip==24.0 \
        diskimage-builder==3.33.0 \
        kolla==18.0.0 \
        kolla-ansible==18.0.0 \
        python-openstackclient==6.6.0 && \
    mkdir -p /etc/kolla

COPY etc/ansible/ansible.cfg /etc/ansible/ansible.cfg
