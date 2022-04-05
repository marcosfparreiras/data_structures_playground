FROM ruby:2.7.5-slim

WORKDIR /usr/src/app
COPY . /usr/src/app/

RUN bundle install

CMD ["sh"]