FROM ubuntu:18.04
MAINTAINER avimehenwal

RUN apt update
RUN apt install -y git

ENV HUGO_VERSION 0.55.6
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb
ENV GITHUB https://github.com/gohugoio/hugo/releases/download

ADD ${GITHUB}/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
	&& rm /tmp/hugo.deb

# Create working directory
RUN mkdir /blog
WORKDIR /blog

# Expose default hugo port
EXPOSE 1313

# By default, serve site
ENV HUGO_BASE_URL http://localhost:1313
CMD hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0 --buildDrafts --buildExpired --buildFuture