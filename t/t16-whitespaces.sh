#!/bin/sh
# $Revision: $
# $Date: $

set -e

# Each test script should include testlib.sh
source testlib.sh
# When the test is ready, set this to false for nice outputs.
# if you want to see what happens, use those flags
# verbose="true"
# warnings="true"

# The conffile part of the test, see confs/* for details.
source confs/base.conf
export BM_ARCHIVE_METHOD="tarball"
export BM_TARBALL_NAMEFORMAT="long"
export BM_TARBALL_FILETYPE="tar.gz"
export BM_TARBALL_DUMPSYMLINKS="false"
export BM_ARCHIVE_ROOT="repository"
export BM_ARCHIVE_METHOD="tarball"
declare -a BM_TARBALL_TARGETS
BM_TARBALL_TARGETS[0]="$PWD/dir1"
BM_TARBALL_TARGETS[1]="$PWD/Program Files"
BM_TARBALL_TARGETS[2]="$PWD/dir2"

source $locallib/sanitize.sh

bm_init_env
bm_init_today

# The test actions
rm -rf $BM_REPOSITORY_ROOT
rm -rf dir1 dir2 "Program Files"

mkdir dir1
cat /etc/passwd > dir1/file1

mkdir dir2
mkdir "Program Files"
touch "Program Files"/toto

create_directories
make_archives

rm -rf dir1
rm -rf dir2
rm -rf "Program Files"
rm -rf repository
exit 0
