#!/bin/sh
# Indexes the documentation in the bundles in this directory.
for dir in */doc/; do
  vim -u NONE -c "helptags $dir" -c quit
done
