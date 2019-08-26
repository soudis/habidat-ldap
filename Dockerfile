FROM osixia/openldap:1.2.5

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /setup
ADD setup* /setup/


