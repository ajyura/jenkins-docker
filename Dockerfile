FROM jenkins

# first stab at passing through plugins and using install-plugins.sh to dl & install
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh </usr/share/jenkins/ref/plugins.txt

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
