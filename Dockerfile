FROM python@sha256:73cc381fa0fe5e6d5dd38f1397da28c70096519d8818c2249f2bc8e1158ba015

ARG USER_UID=1000
RUN adduser --shell /bin/sh --system --group --uid "${USER_UID}" default
USER default

ENV PYTHONPATH $PYTHONPATH:/opt:/opt/src:/home/default/.local/bin
ENV PATH $PATH:/home/default/.local/bin

WORKDIR /opt
