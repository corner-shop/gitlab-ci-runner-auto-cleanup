FROM alpine
RUN apk update && \
   apk add jq curl openssl bash

ENV GITLAB_URL https://gitlab.com
ENV GITLAB_TOKEN xxxx
ENV FREQUENCY 3600

ADD cleanup.sh /usr/local/bin/cleanup.sh
RUN chmod +x /usr/local/bin/cleanup.sh

RUN adduser -h /app -s /bin/bash -D app
USER app
CMD /usr/local/bin/cleanup.sh
