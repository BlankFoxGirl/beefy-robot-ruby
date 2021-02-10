FROM ruby:2.6
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
RUN mkdir /usr/local/script
WORKDIR /usr/local/script
COPY ./ /usr/local/script/
RUN gem install bundle
RUN bundle install
RUN bundle exec rspec
CMD ["bash", "each_scenario.sh"]