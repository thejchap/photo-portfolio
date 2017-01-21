FROM ruby:2.3.3
MAINTAINER Justin Chapman

RUN gem update --system
RUN gem install bundler
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle
ADD . $APP_HOME

EXPOSE 4567
CMD ["bundle", "exec", "rackup", "-p", "4567", "--host", "0.0.0.0"]
