FROM r-base:4.3.0
ENV DEBIAN_FRONTEND=noninteractive
ENV PKG_SYSREQS=true
ENV R_LIBS_SITE=/usr/local/lib/R/site-library

RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN mkdir --parents $R_LIBS_SITE

WORKDIR /app
COPY r-pkgs.R app/r-pkgs.R
# https://github.com/r-lib/pak/issues/251#issuecomment-1104346004
RUN mkdir -p '/custom/R/library' && echo ".libPaths('/custom/R/library')" >> `Rscript -e "cat(R.home())"`/etc/Rprofile.site
RUN Rscript --vanilla app/r-pkgs.R
