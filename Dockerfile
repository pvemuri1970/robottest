#Base image
FROM ubuntu
LABEL version="latest" maintainer="Prasad Vemuri <vemuriprasad@hotmail.com>"

#update the image
RUN apt-get update

#install python
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y pipx
#install robotframework and seleniumlibrary
RUN pipx install robotframework
RUN pipx install robotframework-seleniumlibrary

#The followig are needed for Chrome and Chromedriver installation
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 
RUN apt-get install -y libnss3-dev=3.98-0ubuntu0.22.04.2 libasound2=1.2.11-1build2 libxss1=1:1.2.3-1build3 libappindicator3-1=0.4.92-8ubuntu1 libindicator7=0.5.0-8ubuntu1 gconf2=3.2.6-8ubuntu2 libpango-1.0-0=1.50-1ubuntu0.1 xdg-utils=1.1.0+dfsg-2 fonts-liberation=1.0.12-1
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb 
RUN rm google-chrome*.deb
RUN wget -N http://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN cp /chromedriver /usr/local/bin
RUN rm chromedriver_linux64.zip

#Robot Specific
RUN mkdir /robot
RUN mkdir /results
ENTRYPOINT ["robot"]
