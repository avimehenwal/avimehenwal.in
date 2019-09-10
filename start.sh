#!/usr/bin/fish

# Build
docker build --tag avi/hugo:latest .

# Container
docker run --rm --name "hugo1" -p 1313:1313 \
    --volume (pwd):/blog \
    -e HUGO_WATCH="true" \
    avi/hugo:latest

# Debugginf
# docker run -it \
#     --volume (pwd):/blog \
#     -e HUGO_WATCH="true" \
#     avi/hugo /bin/bash