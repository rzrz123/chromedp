# docker run -t webot recreation --sendEmail  --password  --receiveEmail 
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive TZ=US/central
ENV PATH=$PATH:/usr/local/go/bin

RUN apt update && apt install -y wget unzip ca-certificates --no-install-recommends\
    # install google chrome
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb --no-install-recommends\
    && rm -rf google-chrome-stable_current_amd64.deb \
    # install chrome driver
    wget https://chromedriver.storage.googleapis.com/99.0.4844.51/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip && mv chromedriver /usr/bin/chromedriver \
    && rm -rf chromedriver_linux64.zip \
    # install go
    && wget https://go.dev/dl/go1.18.linux-amd64.tar.gz \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz \
    && rm -rf go1.18.linux-amd64.tar.gz

