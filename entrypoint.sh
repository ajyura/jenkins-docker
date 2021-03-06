#!/bin/bash

# execution priveleges on custom install-plugins script
# chmod +x /usr/local/bin/install-plugins_rev.sh
# rm -f /usr/local/bin/install-plugins.sh

# move custom install-plugins script into temp idrectory for execution
mv /usr/local/bin/install-plugins_rev.sh /tmp/temp/install-plugins.sh
# execution priveleges on custom install-plugins script
chmod +x /tmp/temp/install-plugins.sh

echo 'Running the entrypoint script'

# execute custom isntall-plugins script & iterate through plugins list
/tmp/temp/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')

# run bash in pid1 to keep container running
#/bin/bash -DFOREGROUND

# hacky method to keep container running
tail -f /dev/null
