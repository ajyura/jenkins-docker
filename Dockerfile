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

# copy custom install-plugins script to usable directory
COPY install-plugins.sh /usr/local/bin/install-plugins_rev.sh
# copy entrypoint script to temp directory
COPY entrypoint.sh /tmp/temp/entrypoint.sh
# copy plugins list to usable directory
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# execute entrypoint script
ENTRYPOINT ["sh", "-c", "chmod +x /tmp/temp/entrypoint.sh ; /tmp/temp/entrypoint.sh ; START=1"]
# RUN /usr/local/bin/install-plugins.sh </usr/share/jenkins/ref/plugins.txt
