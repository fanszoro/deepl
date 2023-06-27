FROM nvidia/cuda:11.7.0-cudnn8-devel-ubuntu22.04

LABEL maintainer="fan <fansluck@qq.com>"

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG en_US.UTF-8

RUN apt update && apt install python3 python3-pip python3-dev

RUN pip install -U pip setuptools
