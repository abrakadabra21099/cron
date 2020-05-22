FROM debian
LABEL maintainer="4i! aka \$oRRy <abrakadabra21099@gmail.com>"
LABEL description="Cron scheduler for any cron jobs."
ENV TZ=Europe/Samara
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q=2 update && apt-get --no-install-recommends --show-progress -q=2 -y install cron nfs-common openssh-client screen && \
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

CMD [ "/usr/sbin/cron", "-f", "-L8" ]
