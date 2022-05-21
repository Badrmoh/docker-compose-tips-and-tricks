FROM python:3.8-slim-bullseye

RUN useradd -l -m -s /bin/bash user && \
    apt update && apt install -y openssh-client postgresql-client

USER user
COPY --chown=user docker_id_rsa /home/user/.ssh/id_rsa

ENTRYPOINT bash
