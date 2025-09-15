set -euo pipefail
setopt nullglob

for sz in 480 768 1200; do
  for f in *.(jpg|jpeg|png)(N); do
    base="${f%.*}"
    tmp="__tmp_${base}-${sz}.png"
    vipsthumbnail "$f" --size ${sz}x -o "$tmp"
    avifenc -q 45 -s 6 "$tmp" "${base}-${sz}.avif"
    rm -f "$tmp"
    echo "OK: ${base}-${sz}.avif"
  done
done
