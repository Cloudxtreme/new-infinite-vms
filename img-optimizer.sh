#!/bin/bash
find /home/*/public_html/ -type f -mtime 2 \( ! -name "*-raw.png" -and -name "*.png"  \) -print0 | xargs -0 -P2 -L1 pngquant --quality=80-90 --speed 6 --ext .png --force --skip-if-larger
find /home/*/public_html/ -type f -mtime +2 \( ! -name "*-raw.png" -and -name "*.png"  \) -print0 | xargs -0 -P2 -L1 pngquant --quality=92-100 --speed 6 --ext .png --force --skip-if-larger
find /home/*/public_html/ -type f -mtime 2 \( ! -name "*-raw.jpg" -and -name "*.jpg"  \) -print0 | xargs -0 -P2 -L1 jpegoptim -qP --strip-icc --strip-xmp --strip-com -m 92
find /home/*/public_html/ -type f -mtime 2 \( ! -name "*-raw.jpeg" -and -name "*.jpeg"  \) -print0 | xargs -0 -P2 -L1 jpegoptim -qP --strip-icc --strip-xmp --strip-com -m 92
find /home/*/public_html/ -type f -mtime +2 \( ! -name "*-raw.jpg" -and -name "*.jpg"  \) -print0 | xargs -0 -P2 -L1 jpegoptim -qP --strip-icc --strip-xmp --strip-com
find /home/*/public_html/ -type f -mtime +2 \( ! -name "*-raw.jpeg" -and -name "*.jpeg"  \) -print0 | xargs -0 -P2 -L1 jpegoptim -qP --strip-icc --strip-xmp --strip-com
