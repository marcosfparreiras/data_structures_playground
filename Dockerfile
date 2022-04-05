FROM ruby:2.7.5-slim
LABEL maintainer="Marcos Parreiras"

# Install base dependencies
RUN apt-get update && apt-get install -y build-essential

WORKDIR /usr/src/app
COPY . /usr/src/app/

RUN bundle install

CMD ["bash"]