FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \        
    nodejs           

WORKDIR /app

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ADD ./src/Gemfile /app/Gemfile
ADD ./src/Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD ./src /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
