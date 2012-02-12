#!/bin/sh
# Lists bundles and ftbundles that lack corresponding `*.get` files.
for dir in bundle/*/ ftbundle/*/*/; do
  test -f ${dir%/}.get || echo "$dir"
done
