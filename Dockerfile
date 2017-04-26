FROM jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh </usr/share/jenkins/ref/plugins.txt

# create seed job 
# COPY config/seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/

# enable jenkins cli
# COPY config/jenkins.properties /usr/share/jenkins/ref/

# configure Jenkins with defaults and seed jobs
COPY config/*.xml /usr/share/jenkins/ref/
