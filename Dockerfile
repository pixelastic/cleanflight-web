FROM phusion/passenger-customizable:0.9.15

COPY . /home/app/cleanflight-web

RUN /pd_build/ruby2.2.sh
RUN /pd_build/nodejs.sh

RUN sudo npm install npm -g
RUN sudo npm install gulp -g

RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"


WORKDIR /home/app/cleanflight-web
RUN npm install
RUN bundle
CMD 'gulp'

EXPOSE 3000

#docker build -t cleanflight-web .
#docker run --rm -t -i cleanflight-web bash -l