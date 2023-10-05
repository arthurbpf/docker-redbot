FROM python:3.11-slim-bookworm as core

# Variables
ENV APTLIST="git openjdk-17-jre-headless build-essential"
ENV VENV_PATH="/redbot-venv"
ENV INSTANCE_NAME="docker"

# Install packages
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ${APTLIST};

FROM core as bot-install

# Create config locations
RUN set -eux; \
    mkdir -p /root/.config/Red-DiscordBot; \
    ln -s /app/config/config.json /root/.config/Red-DiscordBot/config.json; \
    mkdir -p /usr/local/share/Red-DiscordBot; \
    ln -s /app/config/config.json /usr/local/share/Red-DiscordBot/config.json; \
    mkdir -p /config/.config/Red-DiscordBot; \
    ln -s /app/config/config.json /config/.config/Red-DiscordBot/config.json;

VOLUME /data

RUN mkdir -p /app
COPY ./app /app

RUN ["chmod", "+x", "/app/install-redbot.sh"]
RUN set -eux; \ 
    /app/install-redbot.sh

FROM bot-install as bot-start

RUN ["chmod", "+x", "/app/start-redbot.sh"]
ENTRYPOINT ["/app/start-redbot.sh"]
