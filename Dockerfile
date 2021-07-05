FROM Thundergang/thunderuserbot:latest

RUN git clone https://github.com/Thundergang/thunderuserbot.git /root/userbot
WORKDIR /root/thunderbot

# Installing the requirements
RUN pip3 install -U -r requirements.txt
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
RUN wget https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && mv -f chromedriver /usr/bin/ && rm chromedriver_linux64.zip
RUN mkdir /root/thunderbot/bin/
ENV PATH="/home/userbot/bin:$PATH"

CMD ["bash","./Extras/startup.sh"]
