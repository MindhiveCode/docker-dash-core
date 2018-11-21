FROM debian:stable-slim

LABEL maintainer.0="Jeff Hodges (@jhodges10)" \
  maintainer.1="Samuel Prado (@skateonrails)"

RUN useradd -r dash \
  && apt-get update -y \
  && apt-get install -y curl gnupg unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GOSU_VERSION=1.10

RUN curl -o /usr/local/bin/gosu -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture) \
  && chmod +x /usr/local/bin/gosu

ENV DASH_VERSION=0.13.0.0-rc4
ENV DASH_FOLDER_VERSION=0.13.0-rc4
ENV DASH_DATA=/home/dash/.dashcore \
  PATH=/opt/dashcore-${DASH_FOLDER_VERSION}/bin:$PATH
RUN curl -SLO https://github.com/dashpay/dash/releases/download/v${DASH_VERSION}/dashcore-${DASH_VERSION}-x86_64-linux-gnu.tar.gz \
  && tar -xzf dashcore-${DASH_VERSION}-x86_64-linux-gnu.tar.gz -C /opt \
  && rm *.tar.gz

VOLUME ["/home/dash/.dashcore"]

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9998 9999 18332 19998 19999

CMD ["dashd"]
