FROM ruby:2.3.3-alpine

RUN gem install sinatra --no-document

RUN mkdir -p /web
WORKDIR /web

COPY sample-app.rb /web/

EXPOSE 4567

ENTRYPOINT ["ruby", "sample-app.rb"]