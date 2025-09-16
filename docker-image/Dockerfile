FROM debian:12-slim

RUN apt-get update && apt-get install -y curl jq gettext-base && rm -rf /var/lib/apt/lists/*

RUN mkdir /server

RUN LATEST_URL=$(curl -s https://api.github.com/repos/BeamMP/BeamMP-Server/releases/latest \
    | jq -r '.assets[] | select(.name | test("BeamMP-Server.debian.12.x86_64")) | .browser_download_url') \
    && curl -L "$LATEST_URL" -o /server/BeamMP-Server \
    && chmod +x /server/BeamMP-Server

COPY ServerConfig.template.toml /server/ServerConfig.template.toml
COPY entrypoint.sh /server/entrypoint.sh
RUN chmod +x /server/entrypoint.sh

WORKDIR /server
ENTRYPOINT ["/server/entrypoint.sh"]

