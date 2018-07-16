VERSION=0.3.4
REPO=https://github.com/dalmatinerdb/dalmatinerdb.git
TARGET_DIRECTORY=/opt/dalmatinerdb

export TARGET_DIRECTORY

clone:
	git clone --branch ${VERSION} ${REPO} src
	cd src; git status

build:
	cd src; ./rebar3 release || true

package:

ips-package:

