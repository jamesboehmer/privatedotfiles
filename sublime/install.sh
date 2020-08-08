#!/bin/bash

# THIS SHOULD BE RUN ONLY AFTER SUBLIME TEXT IS INSTALLED

# set -x
TIME="$(date +%Y%m%d%H%M%S)";
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLEANUPFILE="${1}";
[[ -z $CLEANUPFILE ]] && CLEANUPFILE="/dev/null";

prefsdir="${HOME}/Library/Application Support/Sublime Text 3";

# The license file needs to be copied in as plaintext.  Sublime will read it and convert it to binary.
mkdir -p "${prefsdir}/Local" &>/dev/null;
[[ -e "${prefsdir}/Local/License.sublime_license" ]] || \
echo "Copying ${BASEDIR}/Local/License.sublime_license -> ${prefsdir}/Local/License.sublime_license" && \
cp "${BASEDIR}/Local/License.sublime_license" "${prefsdir}/Local/License.sublime_license";

# Link the Packages/User directory to local dotfiles
mkdir -p "${prefsdir}/Packages" &>/dev/null;
[[ -e "${prefsdir}/Packages/User" ]] && \
mv "${prefsdir}/Packages/User" "${prefsdir}/Packages/User.dotfile.${TIME}" && \
echo "${prefsdir}/Packages/User.dotfile.${TIME}" >> "${CLEANUPFILE}";

echo "${prefsdir}/Packages/User -> ${BASEDIR}/Packages/User";
ln -sf "${BASEDIR}/Packages/User" "${prefsdir}/Packages/User";
