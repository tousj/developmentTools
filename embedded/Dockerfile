# Pull base image.
FROM ubuntu:14.04
MAINTAINER Julien Tous <julien.tous@squadrone-system.com>

LABEL description="This image contain an development environment for Squadrone Hexo+ Autopilot" usage="docker run -it -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v $HOME/.ssh:/root/.ssh sqdr:EmbeddedDev bash"

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  sudo dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y upgrade && \
  apt-get install -y build-essential libc6:i386 wget curl gawk genromfs ssh git vim-nox unzip python-pip python-opencv python-wxgtk2.8 python-dev gitg bash-completion python-matplotlib 
#/ Add files.
RUN pip install pymavlink
RUN pip install pexpect
RUN pip install pyserial

COPY gcc-arm-none-eabi-4_7-2014q2.tgz /usr/local/
RUN cd /usr/local/ && tar -xzf gcc-arm-none-eabi-4_7-2014q2.tgz --strip=1
ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo
RUN chmod -R a+w /usr/local

RUN mkdir -p /home/sqdr
RUN touch /home/sqdr/placeholder
RUN useradd sqdr
RUN chown -R sqdr:sqdr /home/sqdr

USER sqdr

# Set environment variables.
ENV HOME /home/sqdr

# Define working directory.
WORKDIR /home/sqdr

# Define default command.
CMD bash -c "cd workspace/MAVProxy && python setup.py install && cd .. && bash"
