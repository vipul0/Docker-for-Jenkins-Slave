FROM centos:7

USER root

RUN yum install openssh-server -y
 RUN yum install java-1.8.0-openjdk -y
 RUN adduser jenkins
 RUN echo "jenkins:jenkins"  | chpasswd
 RUN mkdir /home/jenkins/
 RUN chown -R jenkins:jenkins /home/jenkins/
 
 
 
 EXPOSE 22
 
 CMD ["/usr/sbin/sshd", "-D"]
