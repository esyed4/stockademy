FROM ruby:3.1.0

LABEL Name=stockademy Version=0.0.1

EXPOSE 3000

RUN curl -sL https://deb.nodesource.com/setup_17.x | bash
RUN apt-get install -y nodejs


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y postgresql-client yarn

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock package.json yarn.lock /app/
RUN bundle install && yarn install

COPY . /app

CMD ["./bin/dev"]

