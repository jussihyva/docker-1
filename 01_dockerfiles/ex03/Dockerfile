FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get -y install openssh-server
RUN apt-get -y install ca-certificates
RUN apt-get -y install tzdata
RUN apt-get -y install perl
# RUN apt-get install -y postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
# RUN EXTERNAL_URL="https://localhost" apt-get -y install gitlab-ce
RUN apt-get -y install gitlab-ce

# ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
