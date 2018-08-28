# Omnios build script for DalmatinerDB

Published to http://repository.stratobuilder.com

CI: https://builderl.stratobuilder.com/builds/philipcristiano/omniosce-build-dalmatinerdb


```
pkg set-publisher http://repository.stratobuilder.com repository.stratobuilder.com
pkg install dalmatinerdb
# Configure in /data/dalmatinerdb/etc/ddb.conf
svcadm enable svc:/application/dalmatinerdb
```
