# Udagram Deployment

## Run locally

In `/docker`:

1. Build the images: `docker-compose -f docker-compose-build.yaml build --parallel`
1. Push the images: `docker-compose -f docker-compose-build.yaml push`
1. Run the container: `docker-compose up`
