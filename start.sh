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

# echo "ARGS = $argv"
# echo "$argv[1]"
echo $status

# Without passwd and group scm-tools like git will not work in the container
# This does not pass any passwords to the container; just the id <-> name mapping.
# getent passwd > passwd.txt
# getent group > group.txt

# getent passwd > passwd                                                                                                                                                 I 
# An error occurred while redirecting file 'passwd'
# open: Is a directory
# mv -v passwd.txt passed
# mv -v group.txt group

# 3. Run Server Container
if set --query $argv[1]
    echo "server"
    docker run --rm --name "hugo1" -p 1313:1313 \
        --volume (pwd):/blog \
        --volume (pwd):(pwd):rw \
        --env DISPLAY=$DISPLAY \
        --env HUGO_WATCH="true" \
        avi/hugo:latest
        # --volume (pwd)/passwd:/etc/passwd \
        # --volume (pwd)/group:/etc/group \
else

# 4. Debug Mode
    echo "debug"
    docker run --rm --name "hugointeractive"\
        --interactive --tty \
        --volume (pwd):/blog \
        --volume (pwd):(pwd):rw \
        --env DISPLAY=$DISPLAY \
        avi/hugo:latest /bin/bash
        # --volume (pwd)/passwd:/etc/passwd \
        # --volume (pwd)/group:/etc/group \
end