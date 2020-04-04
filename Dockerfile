FROM python:3.7-slim-stretch

ARG UID=10001
ARG GID=10001
ARG NAME=p2p

# Creates a User/Group with uid/gid 10001 that can r/w/e to /p2p directory.
RUN groupadd --gid "${GID}" "${NAME}" \
    && useradd --no-log-init --create-home --gid "${NAME}" --uid "${UID}" "${NAME}" \
    && chmod -R 755 /usr/local

WORKDIR "${NAME}"
COPY requirements.txt .
COPY src .
RUN pip install -r requirements.txt
USER "${NAME}"
RUN ls
CMD ["python", "api.py"]