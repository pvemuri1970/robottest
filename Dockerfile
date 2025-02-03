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
RUN apt -get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf2 libpango-1.0-0 xdg-utils fonts-liberation
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
