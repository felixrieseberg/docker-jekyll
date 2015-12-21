FROM ruby:2.1
MAINTAINER felix@felixrieseberg.com

RUN apt-get update \
  && apt-get install -y \
    node \
    python-pygments \
    ncftp \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem install \
  github-pages \
  jekyll \
  jekyll-redirect-from \
  jekyll-sitemap \
  html-proofer \
  kramdown \
  rdiscount \
  rouge

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]