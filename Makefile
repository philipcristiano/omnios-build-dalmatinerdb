PROJECT=dalmatinerdb
VERSION=0.3.3
PROJECT_VERSION=${VERSION}
REPO=https://github.com/dalmatinerdb/dalmatinerdb.git
TARGET_DIRECTORY=/opt/dalmatinerdb
RELEASE_DIR=src/_build/default/rel

export TARGET_DIRECTORY

clone:
	git clone --branch ${VERSION} ${REPO} src
	cd src; git status

build:
	cd src; ./rebar3 release

package:
	@echo do packagey things!

publish: ips-package
ifndef PKGSRVR
	echo "Need to define PKGSRVR, something like http://localhost:10000"
	exit 1
endif
	pkgsend publish -s ${PKGSRVR} -d ${IPS_BUILD_DIR} ${IPS_TMP_DIR}/pkg.pm5.final
	pkgrepo refresh -s ${PKGSRVR}

include erlang-ips.mk
