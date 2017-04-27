#!/bin/bash

chmod +x /usr/local/bin/install-plugins_rev.sh

# rm -f /usr/local/bin/install-plugins.sh
mv /usr/local/bin/install-plugins_rev.sh /tmp/nstall-plugins.sh

chmod +x /tmp/install-plugins.sh

echo 'Running the custom DL & I plugins script'
/tmp/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
