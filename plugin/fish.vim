" fix command substitution when using Fish shell
if $SHELL =~ 'fish$'
  set shell=/bin/sh
endif
