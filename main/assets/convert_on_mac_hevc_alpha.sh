#!/bin/bash
set -euo pipefail

# 在三支 webm 所在資料夾執行：
# bash convert_on_mac_hevc_alpha.sh

for f in *_river_ar_motion.webm; do
  base="${f%.webm}"
  echo "Converting $f -> ${base}_hevc_alpha.mov"
  ffmpeg -y \
    -c:v libvpx-vp9 \
    -i "$f" \
    -c:v hevc_videotoolbox \
    -allow_sw 1 \
    -alpha_quality 1 \
    -tag:v hvc1 \
    -pix_fmt yuva420p \
    -an \
    -movflags +faststart \
    "${base}_hevc_alpha.mov"
done
