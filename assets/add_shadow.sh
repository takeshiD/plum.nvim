magick "$1" \
  \( +clone -background "#00000080" -shadow 80x18+0+16 \) \
  +swap -background none -layers merge +repage \
  "$2"
