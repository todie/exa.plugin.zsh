#!/bin/bash

BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"

pinfo() {
  printf '%s\n' "${BOLD}${GREY}>${NO_COLOR} $*"
}

pwarn() {
  printf '%s\n' "${YELLOW}! $*${NO_COLOR}"
}

perror() {
  printf '%s\n' "${RED}x $*${NO_COLOR}" >&2
}

pcompleted() {
  printf '%s\n' "${GREEN}✓${NO_COLOR} $*"
}

BINDIR=~/.local/bin
mkdir -p "$BINDIR"

if [ -f "$BINDIR/exa" ]; then
  perror "$BINDIR/exa already exists, delete to reinstall"
  exit
fi

pinfo "Installing exa, OS: ${OS}, ARCH: ${ARCH}, TMPDIR: ${UNDERLINE}${TMPDIR}${NO_COLOR}"

TMPDIR="$(mktemp -d -t install-exa.XXXXXX)"
(
  set -e
  trap 'perror $LINENO' ERR

  cd "$TMPDIR" || {
    perror "Failed to cd to $TMPDIR"
    exit 1
  }

  OS="$(uname | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m)"
  VERSION="$(curl -sL "https://api.github.com/repos/ogham/exa/releases/latest" | jq -r '.tag_name')"
  TARGET="exa-${OS}-${ARCH}-${VERSION}.zip"
  curl -sLO "https://github.com/ogham/exa/releases/download/${VERSION}/${TARGET}"
  unzip "$TARGET" -d "$BINDIR/.."
  pcompleted "Succesfully installed ${UNDERLINE}${BINDIR}/exa${NO_COLOR}"
)
rm -rf "$TMPDIR"
