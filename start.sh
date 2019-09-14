#!/usr/bin/fish

# 1. Collect Assets
# https://github.com/gohugoio/hugo/releases/download/v0.58.2/hugo_0.58.2_Linux-32bit.deb
set --local HUGO_VERSION 0.55.6
set --local HUGO_BINARY hugo_"$HUGO_VERSION"_Linux-64bit.deb
set --local ASSET_HUGO_URL https://github.com/gohugoio/hugo/releases/download/v"$HUGO_VERSION"/"$HUGO_BINARY"
set --local ASSET_HUGO_LOC ./Assets
set --local ASSET_HUGO_NAME hugo.deb
set --local ASSET_HUGO "$ASSET_HUGO_LOC"/"$ASSET_HUGO_NAME"

if test -e $ASSET_HUGO_LOC
    echo "Reusing Asset -> $ASSET_HUGO_LOC exists"
else
    echo "$ASSET_HUGO_LOC not found"
    mkdir -p ASSET_HUGO_LOC
    echo "DOWNLOADING ASSET"
    echo $HUGO_VERSION $HUGO_BINARY $ASSET_HUGO_LOC
    echo $ASSET_HUGO_URL
    echo $ASSET_HUGO
    wget --output-document=$ASSET_HUGO $ASSET_HUGO_URL
end

# 2. Build using assets
docker build \
    --build-arg ASSET_HUGO_LOC=$ASSET_HUGO \
    --tag avi/hugo:latest .

# 3. Run Container
docker run --rm --name "hugo1" -p 1313:1313 \
    --volume (pwd):/blog \
    -e HUGO_WATCH="true" \
    avi/hugo:latest

# Debugginf
# docker run -it \
#     --volume (pwd):/blog \
#     -e HUGO_WATCH="true" \
#     avi/hugo /bin/bash