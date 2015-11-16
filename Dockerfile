FROM saas_module

RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get update

RUN apt-get -y install imagemagick

ADD app /bin/app
RUN chmod +x /bin/app

