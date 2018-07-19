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
	mkdir -p ${IPS_BUILD_DIR}/opt/ ${IPS_TMP_DIR} "${IPS_BUILD_DIR}/etc"
	mkdir -p ${IPS_BUILD_DIR}/data/dalmatinerdb/etc
	mv ${RELEASE_DIR}/ddb/etc/ddb.conf ${IPS_BUILD_DIR}/data/dalmatinerdb/etc/ddb.conf
	cp -R ${RELEASE_DIR} ${IPS_BUILD_DIR}/opt/${PROJECT}
	rm -rf ${IPS_BUILD_DIR}/opt/${PROJECT}/${PROJECT}_release-*.tar.gz
	cp LICENSE.pkg ${IPS_BUILD_DIR}/

publish: ips-package
ifndef PKGSRVR
	echo "Need to define PKGSRVR, something like http://localhost:10000"
	exit 1
endif
	pkgsend publish -s ${PKGSRVR} -d ${IPS_BUILD_DIR} ${IPS_TMP_DIR}/pkg.pm5.final
	pkgrepo refresh -s ${PKGSRVR}

include erlang-ips.mk
