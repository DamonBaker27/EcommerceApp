FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
ADD . /ByteMe-Docker
WORKDIR /ByteMe-Docker
RUN bundle install

EXPOSE 3000

CMD ["bash"]