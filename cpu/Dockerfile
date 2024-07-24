FROM ubuntu:22.04 AS base

LABEL maintainer="fan <fansluck@qq.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV LESSCHARSET utf-8
RUN apt update && apt install  -y git python3 python3-pip python3-dev &&\
    pip install -U pip setuptools
ENV TERM=xterm
RUN groupadd -g 100 -o fan
RUN useradd -m -u 1000 -g 100 -o -s /bin/bash fan
USER fan
RUN pip install ipython jupyter numpy torch==2.3.1 tensorflow-cpu==2.17.0 \
    opencv-python opencv-contrib-python onnx onnxruntime onnx-simplifier tf2onnx

FROM ubuntu:22.04

LABEL maintainer="fan <fansluck@qq.com>"

ARG DEBIAN_FRONTEND=noninteractive
ARG UNAME=fan
ARG UID=1000
ARG GID=100
ENV LANG C.UTF-8
ENV LESSCHARSET utf-8
RUN apt update && apt install  -y git python3 python3-pip python3-dev &&\
    pip install -U pip setuptools
ENV TERM=xterm
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
COPY --from=base /home/fan/.local /home/${UNAME}/.local
# localization
RUN git config --global core.quotepath false &&\
    git config --global i18n.commitencoding utf-8 &&\
    git config --global i18n.logoutputencoding gbk &&\
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
ENV PATH=$PATH:~/.local/bin/
WORKDIR /home/$UNAME
CMD /bin/bash