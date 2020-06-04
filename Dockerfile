FROM openjdk:11

EXPOSE 8042

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV DATA_DIR "/data"
ENV HOST_PORT 8042
ADD docker-entrypoint.sh /

RUN \
  curl https://sdk.cloud.google.com | bash && \
  echo ". /root/google-cloud-sdk/path.bash.inc" >> /root/.bashrc && \
  echo ". /root/google-cloud-sdk/completion.bash.inc" >> /root/.bashrc  && \
  bash -ic "gcloud components install -q pubsub-emulator" && \
  mkdir ${DATA_DIR} && \
  chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
