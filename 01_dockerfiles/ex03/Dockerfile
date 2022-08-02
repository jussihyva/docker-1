FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get -y install openssh-server
RUN apt-get -y install ca-certificates
RUN apt-get -y install tzdata
RUN apt-get -y install perl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
RUN apt-get -y install gitlab-ee

RUN mkdir -p /etc/gitlab/ssl
RUN chmod 755 /etc/gitlab/ssl


ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && service ssh start && gitlab-ctl reconfigure && tail -f /dev/null
