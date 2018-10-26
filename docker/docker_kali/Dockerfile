FROM kalilinux/kali-linux-docker

# Setup
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Initialize
RUN mkdir -p /src
WORKDIR /src

# RUN
CMD ["/bin/bash"]
# $ docker run -ti --rm -v $(pwd):/src marcolancini/kali