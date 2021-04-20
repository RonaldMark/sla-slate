FROM ruby:2.7

WORKDIR /srv/slate

VOLUME /srv/slate/*

EXPOSE 8901

COPY . /srv/slate

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
    && gem install bundler \
    && bundle install \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "server"]
