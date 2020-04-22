# Udagram Deployment

## Docker

In `/docker`:

1. Build the images: `docker-compose -f docker-compose-build.yaml build --parallel`
1. Push the images: `docker-compose -f docker-compose-build.yaml push`
1. Run the containers: `docker-compose up`

## Kubernetes

### Setup

In `/k8s`:

- Create files from examples:
  - `env-configmap.yaml`
  - `aws-secret.yaml`
    - Replace `___INSERT_AWS_CREDENTIALS_FILE__BASE64____` with `cat ~/.aws/credentials | base64`
  - `env-secret.yaml`

### Run locally

In `/k8s`:

- Apply files `./apply.sh`
- View resources `kubectl get --help`
- Forward ports
  - `kubectl port-forward service/reverseproxy 8080:8080`
  - `kubectl port-forward service/frontend 8100:8100`
- View the app at `localhost:8100`
