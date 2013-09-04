FROM ubuntu
RUN apt-get install -y ruby rubygems git
RUN git clone https://gist.github.com/11d45cb1767629962c5f.git /opt/sinatra/
RUN gem install bundler
EXPOSE :5000
RUN cd /opt/sinatra && bundle install
CMD ["/usr/local/bin/foreman","start","-d","/opt/sinatra"]