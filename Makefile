VERSION=0.3.4
REPO=https://github.com/dalmatinerdb/dalmatinerdb.git

package:
	git clone --branch ${VERSION} ${REPO} src
	cd src; git status

