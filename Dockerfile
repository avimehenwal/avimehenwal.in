FROM ubuntu:18.04
MAINTAINER avimehenwal

RUN apt update
RUN apt install -y git

# expect a build-time variable
ARG ASSET_HUGO_LOC
# use the value to set the ENV var default
ENV ASSET_HUGO_LOC $ASSET_HUGO_LOC
RUN echo $ASSET_HUGO_LOC 

COPY ${ASSET_HUGO_LOC} /tmp/hugo.deb
# ADD $ASSET_HUGO_LOC /tmp/hugo.deb
RUN ls /tmp
RUN dpkg --install /tmp/hugo.deb \
	&& rm /tmp/hugo.deb
# TEST
RUN hugo version

# Set user for subsequent commands
# RUN addgroup --gid 1024 avi
# RUN adduser --disabled-password --gecos "" --force-badname --ingroup avi avi 
# USER avi
# Create working directory
RUN mkdir /blog
WORKDIR /blog
VOLUME [ "/blog" ]

# Expose default hugo port
EXPOSE 1313

# By default, serve site
ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0 --buildDrafts --buildExpired --buildFuture