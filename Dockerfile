FROM jenkins

EXPOSE 443

USER root

# initialize start variable to run CMD on 'docker run' only
ENV START=0

# adding init.groovy file to modify content security policy
COPY config/init.groovy /var/lib/jenkins/

# add a seed job to the jobs directory
# COPY config/create-seed-job.xml /var/jenkins_home/jobs

# add a seed job to the init.groovy.d directory for post initialization
# COPY config/create-seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/

# enable jenkins cli - need to create a properties file
# COPY config/jenkins.properties /usr/share/jenkins/ref/

# configure Jenkins with defaults and seed jobs
COPY config/*.xml /usr/share/jenkins/ref/

# first stab at passing through plugins and using install-plugins.sh to dl & install
# RUN rm -f /usr/local/bin/install-plugins.sh
COPY install-plugins.sh /usr/local/bin/install-plugins_rev.sh
COPY dl_i_plugins.sh /tmp/temp/dl_i_plugins.sh
# RUN chmod +x /tmp/dj_i_plugins.sh
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
CMD ["sh", "-c", "chmod +x /tmp/temp/dl_i_plugins.sh ; /tmp/temp/dl_i_plugins.sh ; START=1"]
# RUN /usr/local/bin/install-plugins.sh </usr/share/jenkins/ref/plugins.txt
