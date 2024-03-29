# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
  echo "**** install apt-transport-https ****" && \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  echo "**** add mono repository ****" && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official.list && \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    --no-install-recommends \
    --no-install-suggests \
    ca-certificates-mono \
    libcurl4-openssl-dev \
    mono-runtime \
    mono-vbnc && \
  echo "**** clean up ****" && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
