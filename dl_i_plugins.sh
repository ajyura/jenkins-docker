#!/bin/bash

chmod +x /usr/local/bin/install-plugins_rev.sh
echo 'Running the custom DL & I plugins script'
/usr/local/bin/install-plugins_rev.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
