# Docker Container for Google PubSub emulator

The gcloud suite has an emulator for Google PubSub, which is great for testing locally how to run code against their APIs. 

However, it is not very useful if you want to run in a containerized environment, and want to test how the whole thing behaves. Hence this container. 

# How to use

## Building Image Locally

```
$ git clone https://github.com/mcwarman/docker-pubsub-emulator.git
$ cd docker-pubsub-emulator
$ docker build -t mcwarman/pubsub-emulator:latest .
```

## Pulling Image from Docker Hub

```
 $ docker pull mcwarman/pubsub-emulator
```

## Using Image

```
$ docker run --rm -d --name pubsub-emulator -p 8042:8042 mcwarman/pubsub-emulator:latest
```

Now you need to run the equivalent of the ```$(gcloud beta emulators pubsub env-init)``` command

```
$ export PUBSUB_EMULATOR_HOST=localhost:8042
```

Now you can use the standard APIs such as [gcloud-python](https://github.com/googlecloudplatform/gcloud-python) to interact with it. 

# ENV VARIABLES / TWEAKS
## Data Store

You can bind a volume to /data in the container to get resilient data. 

```
$ docker run -it --name pubsub-emulator -p 8042:8042 -v /path/to/my/data/folder:/data mcwarman/pubsub-emulator:latest
```

## Port

You can also change the port where the emulator runs by editing the HOST_PORT environment variable. 

## Logs

The emulator logs are stored in /var/log/pubsub.log, and also available at `docker log ...`.




