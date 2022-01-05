FROM ruby:3.0.3

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn default-mysql-client
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install
RUN yarn install

EXPOSE 3000
