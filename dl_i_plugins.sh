#!/bin/bash

chmod +x /usr/local/bin/install-plugins_rev.sh
/usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')
