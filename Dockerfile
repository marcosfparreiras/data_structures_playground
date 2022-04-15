FROM ruby:2.7.5-slim
LABEL maintainer="marcosfparreiras@gmail.com"

# Install base dependencies
RUN apt-get update && apt-get install -y build-essential git

WORKDIR /usr/src/app
COPY . /usr/src/app/

RUN bundle install

CMD ["bash"]
