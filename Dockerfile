FROM openjdk:8-jdk

EXPOSE 8042

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV DATA_DIR "/data"
ENV HOST_PORT 8042
ADD docker-entrypoint.sh /

RUN \
  curl https://sdk.cloud.google.com | bash && \
  cat /root/google-cloud-sdk/path.bash.inc | bash && \
  cat /root/google-cloud-sdk/completion.bash.inc | bash && \
  /root/google-cloud-sdk/bin/gcloud components install -q pubsub-emulator && \
  mkdir ${DATA_DIR} && \
  chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
