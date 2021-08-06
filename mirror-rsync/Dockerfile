FROM ubuntu:18.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    ubumirror \
    rsync \
    openssh-client \
    ca-certificates \
    htop \
    tmux \
    cron

COPY ubumirror.conf /etc/ubumirror.conf
# COPY *.sh /

RUN mkdir -p /mnt/mirror
RUN mkdir -p /mnt/mirror/ubuntu
RUN mkdir -p /mnt/mirror/ubuntu-cdimage
RUN mkdir -p /mnt/mirror/ubuntu-releases
RUN mkdir -p /mnt/mirror/ubuntu-ports

RUN mkdir -p /var/log/ubumirror

# crontab

# Copy rsync-cron file to the cron.d directory
COPY rsync-cron /etc/cron.d/rsync-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/rsync-cron

# Apply cron job
RUN crontab /etc/cron.d/rsync-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log