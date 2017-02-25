#!/bin/bash

set -e

FIREFOX_BIN=/Applications/Firefox.app/Contents/MacOS/firefox
BIBI_INDEX=~/opt/bibi/bib/i/index.html
FIREFOX_ARGS="-profile app $BIBI_INDEX"

if [ -n "$TMUX" ]; then
  reattach-to-user-namespace $FIREFOX_BIN $FIREFOX_ARGS >/dev/null 2>&1 &
else
  $FIREFOX_BIN $FIREFOX_ARGS >/dev/null 2>&1 &
fi
