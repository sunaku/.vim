#!/bin/sh
# index help documentation in bundles
for dir in bundle/*/doc/; do
  vim -u NONE -c "helptags $dir" -c quit
done
