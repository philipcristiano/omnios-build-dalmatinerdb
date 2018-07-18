PROJECT=dalmatinerdb
VERSION=0.3.3
PROJECT_VERSION=${VERSION}
REPO=https://github.com/dalmatinerdb/dalmatinerdb.git
TARGET_DIRECTORY=/opt/dalmatinerdb
RELEASE_DIR=src/_build/default

export TARGET_DIRECTORY

clone:
	git clone --branch ${VERSION} ${REPO} src
	cd src; git status

build:
	cd src; ./rebar3 release

package:
	@echo do packagey things!

include erlang-ips.mk
