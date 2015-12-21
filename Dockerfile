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
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

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