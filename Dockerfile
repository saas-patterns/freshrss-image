FROM registry.access.redhat.com/ubi9/php-80

RUN mkdir /tmp/src/ && curl -L https://github.com/FreshRSS/FreshRSS/archive/refs/heads/edge.tar.gz | tar xzv --strip-components=1 -C /tmp/src/ && /usr/libexec/s2i/assemble && rm -rf /tmp/src

ADD entrypoint.sh /usr/bin/

ADD config.custom.php.template ./data/

CMD /usr/bin/entrypoint.sh
