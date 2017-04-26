FROM jenkinsci/jenkins:lts

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt

# enable jenkins cli
# COPY config/jenkins.properties /usr/share/jenkins/ref/

# configure Jenkins with defaults and seed jobs
COPY config/*.xml /usr/share/jenkins/ref/
