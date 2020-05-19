ARG MULTICHAIN_VERSION=2.0.6-enterprise-demo
FROM iteratec/multichain-base:${MULTICHAIN_VERSION}
LABEL maintainer="nils.kuhn@iteratec.com"

ADD ./runchain.sh /root/runchain.sh
RUN chmod a+x /root/runchain.sh

CMD ["/bin/bash", "/root/runchain.sh"]
