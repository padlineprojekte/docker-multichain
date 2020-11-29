ARG MULTICHAIN_VERSION=2.1.1-enterprise-demo
FROM iteratec/multichain-node:${MULTICHAIN_VERSION}
LABEL maintainer="nils.kuhn@iteratec.com"

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip sqlite3 libsqlite3-dev \
        && pip install pycrypto py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && wget https://github.com/MultiChain/multichain-explorer/archive/master.tar.gz \
    && tar -xvzf master.tar.gz \
    && rm -Rf master.tar.gz

RUN cd /root/multichain-explorer-master \
    && python setup.py install --user

ADD ./runexplorer.sh /root/runexplorer.sh
RUN chmod a+x /root/runexplorer.sh

RUN echo "1"

EXPOSE 2750

CMD ["/bin/bash", "/root/runexplorer.sh"]
