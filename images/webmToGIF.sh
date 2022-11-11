#!/bin/bash
# Adapted from https://gist.github.com/Potherca/18423260e2c9a4324c9ecb0c0a284066

INPUT="$1"
OUTPUT="$(basename "${INPUT%.*}")"
ffmpeg -i "${INPUT}" \
        -vf "fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
        -loop -1 \
        "${OUTPUT}.gif"
gifsicle --optimize=3 --output "${OUTPUT}-optimized.gif" --resize-height 600 "${OUTPUT}.gif"