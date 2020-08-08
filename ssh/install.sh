#!/bin/bash

# set -x
TIME="$(date +%Y%m%d%H%M%S)";
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLEANUPFILE="${1}";
[[ -z $CLEANUPFILE ]] && CLEANUPFILE="/dev/null";

sshdir="${HOME}/.ssh";

mkdir -p "${sshdir}/sockets" &>/dev/null;

[[ -e "${sshdir}/config" ]] && mv "${sshdir}/config" "${sshdir}/config.dotfilebak.${TIME}" && echo "${sshdir}/config.dotfilebak.${TIME}" >> "${CLEANUPFILE}";
echo -e "Linking ${sshdir}/config -> ${BASEDIR}/config";
ln -sf "${BASEDIR}/config" "${sshdir}/config";

[[ -e "${sshdir}/config.d" ]] && mv "${sshdir}/config.d" "${sshdir}/config.d.dotfilebak.${TIME}" && echo "${sshdir}/config.d.dotfilebak.${TIME}" >> "${CLEANUPFILE}";
echo -e "Linking ${sshdir}/config.d -> ${BASEDIR}/config.d";
ln -sf "${BASEDIR}/config.d" "${sshdir}/config.d";
