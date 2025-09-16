#!/bin/bash
envsubst < /server/ServerConfig.template.toml > /server/ServerConfig.toml
exec /server/BeamMP-Server