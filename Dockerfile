FROM ubuntu:14.04
MAINTAINER vipul jain <vipulj0903@gmail.com>


# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git


# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd


# Install JDK 7 (latest edition)
RUN apt-get install -y openjdk-7-jdk


# Add user jenkins to the image
RUN adduser jenkins


# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

#Create Direcory for workspace Jenkins
RUN mkdir /home/jenkins/


RUN chown -R jenkins:jenkins /home/jenkins/.m2/ 

RUN apt-get install -y maven
# Standard SSH port
EXPOSE 22

# Start SSH service in background
CMD ["/usr/sbin/sshd", "-D"]
