FROM ruby:2.5

RUN gem install bundler

WORKDIR /app
COPY . .
RUN bundle install
EXPOSE 3000

