FROM azul/zulu-openjdk-alpine:8

EXPOSE 8042

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV DATA_DIR "/data"
ENV HOST_PORT 8042
ADD docker-entrypoint.sh /

RUN \
  apk add --no-cache --update ca-certificates bash curl python3  && \
  curl https://sdk.cloud.google.com | bash && \
  /root/google-cloud-sdk/bin/gcloud components install -q pubsub-emulator beta && \
  mkdir ${DATA_DIR} && \
  chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
