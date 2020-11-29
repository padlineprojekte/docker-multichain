ARG MULTICHAIN_VERSION=2.1.1-enterprise-demo
FROM iteratec/multichain-base:${MULTICHAIN_VERSION}
LABEL maintainer="nils.kuhn@iteratec.com"

COPY ./runchain.sh /root/runchain.sh
COPY ./blocknotify.sh /root/blocknotify.sh
RUN chmod a+x /root/runchain.sh
RUN chmod a+x /root/blocknotify.sh

RUN echo "1"

CMD ["/bin/bash", "/root/runchain.sh"]
