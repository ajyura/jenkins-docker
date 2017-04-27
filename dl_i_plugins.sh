#!/bin/bash

chmod +x /usr/local/bin/install-plugins.sh
chmod +x /usr/local/bin/install-plugins_rev.sh

rm -f /usr/local/bin/install-plugins.sh
mv /usr/local/bin/install-plugins_rev.sh /usr/local/bin/install-plugins.sh

echo 'Running the custom DL & I plugins script'
/usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
