FROM lsiobase/xenial
MAINTAINER sparklyballs

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

# install packages
RUN \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
 echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | tee /etc/apt/sources.list.d/mono-official.list && \
 apt-get update && \
 apt-get install -y \
	--no-install-recommends \
	--no-install-suggests \
	bzip2 \
	ca-certificates-mono \
	libcurl4-openssl-dev \
	mediainfo \
	mono-devel \
	mono-vbnc \
	python \
	sqlite3 \
	unzip && \

# clean up
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
