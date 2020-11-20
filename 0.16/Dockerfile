FROM debian:stable-slim

LABEL maintainer.0="Jeff Hodges (@jhodges10)" \
  maintainer.1="Samuel Prado (@skateonrails)"

RUN useradd -r dash \
  && apt-get update -y \
  && apt-get install -y curl gnupg unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  # Adding gpg for Dash files
  && curl https://keybase.io/udjinm6/pgp_keys.asc | gpg --import \
  && curl https://keybase.io/nmarley/pgp_keys.asc | gpg --import \
  # Adding gpg for gosu
  && gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4

ENV GOSU_VERSION=1.11

RUN curl -o /usr/local/bin/gosu -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }') \
  && curl -o /usr/local/bin/gosu.asc -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }').asc \
  && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

ENV DASH_VERSION=0.16.1.1
ENV DASH_FOLDER_VERSION=0.16.0
ENV DASH_SHASUM="98bc0f50c65ca1a149c95f1b87ae926457e0e0623af7a1e2a7e345fdfe0eecc8  dashcore-${DASH_VERSION}-x86_64-linux-gnu.tar.gz"
ENV DASH_DATA=/home/dash/.dashcore \
  PATH=/opt/dashcore-${DASH_FOLDER_VERSION}/bin:$PATH

RUN curl -SLO https://github.com/dashpay/dash/releases/download/v${DASH_VERSION}/dashcore-${DASH_VERSION}-x86_64-linux-gnu.tar.gz \
  && echo "${DASH_SHASUM}" | sha256sum -c \
  && tar -xzf dashcore-${DASH_VERSION}-x86_64-linux-gnu.tar.gz -C /opt \
  && rm *.tar.gz

VOLUME ["/home/dash/.dashcore"]

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9998 9999 18332 19998 19999

CMD ["dashd"]
