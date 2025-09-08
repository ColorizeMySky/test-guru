FROM ruby:3.3.5-slim

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g yarn

ENV APP_ROOT /app
WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

ENV RAILS_ENV production
ENV NODE_ENV=production

RUN NODE_OPTIONS=--openssl-legacy-provider bundle exec rails webpacker:compile
RUN RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
