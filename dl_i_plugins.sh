#!/bin/bash

if [[ START=0 ]]; then
    chmod +x /usr/local/bin/install-plugins_rev.sh
    # rm -f /usr/local/bin/install-plugins.sh
    mv /usr/local/bin/install-plugins_rev.sh /tmp/temp/install-plugins.sh

    chmod +x /tmp/temp/install-plugins.sh

    echo 'Running the custom DL & I plugins script'
    /tmp//temp/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
fi
