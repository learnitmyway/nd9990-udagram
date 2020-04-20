# Udagram Deployment

## Docker

In `/docker`:

1. Build the images: `docker-compose -f docker-compose-build.yaml build --parallel`
1. Push the images: `docker-compose -f docker-compose-build.yaml push`
1. Run the container: `docker-compose up`

## Kubernetes

In `/k8s`:

- Create files from examples:
  - `env-configmap.yaml`
  - `aws-secret.yaml`
    - Replace `___INSERT_AWS_CREDENTIALS_FILE__BASE64____` with `cat ~/.aws/credentials | base64`
  - `env-secret.yaml`
