FROM    ubuntu:12.04
MAINTAINER Antonio Terreno "antonio.terreno@gmail.com"

RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y ruby rubygems

RUN mkdir /opt/sinatra

ADD server.rb /opt/sinatra/server.rb
ADD Gemfile /opt/sinatra/Gemfile
ADD Procfile /opt/sinatra/Procfile

RUN gem install bundler

EXPOSE :5000
RUN cd /opt/sinatra && bundle install
CMD ["/usr/local/bin/foreman","start","-d","/opt/sinatra"]
