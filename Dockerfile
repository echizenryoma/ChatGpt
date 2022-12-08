FROM python:3.11.1-slim-bullseye
WORKDIR /opt/chatgpt-telegram-bot
RUN apt-get update && apt -y install git \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip \
    && pip install pipenv
RUN mkdir -p /opt \
    && cd /opt \
    && git clone https://github.com/n3d1117/chatgpt-telegram-bot.git
RUN cd /opt/chatgpt-telegram-bot \
    && pipenv install --python /usr/local/bin/python3
CMD ["pipenv run python3 main.py"]
