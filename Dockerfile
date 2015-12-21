FROM ruby:2.1
MAINTAINER felix@felixrieseberg.com

# Install Basics
RUN apt-get update \
  && apt-get install -y \
    python-pygments \
    ncftp \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
  apt-get install -yq nodejs build-essential

# fix npm - not the latest version installed by apt-get
RUN npm install -g npm \
  && npm install -g gh

# Install Gems
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