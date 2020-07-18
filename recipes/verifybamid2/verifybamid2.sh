#!/bin/bash
# Wrapper for VerifyBAMID2
# Avoids name conflicts with standard VerifyBamID and
# provides each access to referencing resource files
# Usage:
# verifybamid2 -h or --help
# please refer to detailed usage at https://github.com/Griffan/VerifyBamID#verifybamid2
set -eu -o pipefail

# Find original directory of bash script, resolving symlinks
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in/246128#246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


if [[ $SVD == "-h" || $SVD == "--help" ]]; then
	$DIR/VerifyBamID --help
	echo "Notice: The default resorce files for --SVDPrefix are located at $DIR/resource/"
else
	$DIR/VerifyBamID $@
fi
