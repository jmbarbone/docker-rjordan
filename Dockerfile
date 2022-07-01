FROM r-base:4.0.3
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

# r things
RUN apt-get install --assume-yes --no-upgrade \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libsodium-dev \
    libv8-dev \
    libmagick++-dev\
    libmariadb-dev \
    unixodbc-dev

WORKDIR /app
COPY r-pkgs.R app/r-pkgs.R
RUN Rscript --vanilla app/r-pkgs.R
