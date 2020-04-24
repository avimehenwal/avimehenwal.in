FROM ubuntu:18.04
MAINTAINER avimehenwal

RUN apt update
RUN apt install -y git

# expect a build-time variable
ARG ASSET_HUGO_LOC
# use the value to set the ENV var default
ENV ASSET_HUGO_LOC $ASSET_HUGO_LOC
RUN echo $ASSET_HUGO_LOC

# set locale
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.en"
ENV LC_ALL "en_US.UTF-8"
# RUN locale-gen en_US && locale-gen en_US.UTF-8 && update-locale

COPY ${ASSET_HUGO_LOC} /tmp/hugo.deb
# ADD $ASSET_HUGO_LOC /tmp/hugo.deb
RUN ls /tmp
RUN dpkg --install /tmp/hugo.deb \
	&& rm /tmp/hugo.deb
# TEST
RUN hugo version

ENV USER_NAME=avi
ENV USER_ID=1000
ENV GROUP_NAME=avi
ENV GROUP_ID=1000
RUN groupadd --gid $GROUP_ID $GROUP_NAME \
    && useradd --uid $USER_ID --gid $GROUP_ID $USER_NAME
USER $USER_NAME
COPY . /blog
WORKDIR /blog
VOLUME [ "/blog", ]
# "/etc/passwd", "/etc/group" ]

# Expose default hugo port
EXPOSE 1313

# By default, serve site
ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0 --buildDrafts --buildExpired --buildFuture