# Udagram

[![Build Status](https://travis-ci.com/learnitmyway/nd9990-udagram.svg?branch=master)](https://travis-ci.com/learnitmyway/nd9990-udagram)

[Link to starter code](https://github.com/scheeles/cloud-developer/tree/06-ci/course-03/exercises)

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

The project is split as follows:

1. udacity-c3-deployment - start here after setting up everything
1. udacity-c3-frontend - a basic Ionic client web application which consumes the RestAPI Backend.
1. udacity-c3-restapi-feed - a Node-Express feed microservice.
1. udacity-c3-restapi-user - a Node-Express user microservice.
1. [Image filter](https://github.com/learnitmyway/nd9990-udagram-image-filter) (separate repo)

## Project Instructions

### Steps

1. Divide the application into smaller services
1. Containerize the application, create the Kubernetes resource, and deploy it to a Kubernetes cluster.
1. Implement automatic continuous integration (CI) and continuous delivery (CD) using Travis CI.
1. Extend the application with deployments and be able to do rolling-updates and rollbacks

### Submission instructions

- Screenshot of TravisCI which shows the successful build and deploy steps
- The public GitHub repo and the docker hub images
- Screenshot of kubectl get pod which shows all running containers
- Screenshot of the application

## Environment variables

Add to `.zshrc`:

```sh
export POSTGRESS_USERNAME=myusername;
export POSTGRESS_PASSWORD=mypassword;
export POSTGRESS_DB=postgres;
export POSTGRESS_HOST=udagramdemo.abc4def.us-east-2.rds.amazonaws.com;
export AWS_REGION=us-east-2;
export AWS_PROFILE=default;
export AWS_BUCKET=udagramdemo;
export JWT_SECRET=helloworld;
```

## AWS Setup

### Brew Fromulae

- awscli
- awsebcli

### Amazon RDS

- PostgreSQL
- Free tier
- publicly accessible
- Initial database name (eg. udagramdev)

### Amazon S3

- Create Bucket (eg. udagram-david-dev)
- Properties > Default Encryption > AES-256
- Permissions > CORS configuration

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <CORSRule>
     <AllowedOrigin>*</AllowedOrigin>
     <AllowedMethod>POST</AllowedMethod>
     <AllowedMethod>GET</AllowedMethod>
     <AllowedMethod>PUT</AllowedMethod>
     <AllowedMethod>DELETE</AllowedMethod>
     <AllowedMethod>HEAD</AllowedMethod>
     <AllowedHeader>*</AllowedHeader>
  </CORSRule>
  </CORSConfiguration>
  ```

### AWS IAM

#### Add user with access to S3 bucket

- Add user (eg. udagram-david-dev) with programmatic and console access

  - Create group (eg. udagram-dev)
    - Create policy (eg. udagram_media_dev_s3)
      - Service: S3
      - Actions: all
      - Resources:
        - bucket (eg. `arn:aws:s3:::udagram-david-dev`)
        - object (eg. `arn:aws:s3:::udagram-david-dev/*`)

#### Add EC2 role with access to S3 bucket

- Add role (eg. udagram_dev_service_role) with EC2 use case
  - Assign policy (eg. udagram_media_dev_s3)

### Configure locally

- `aws confgiure`
- Check everything is ok in `~/.aws`

## Deployment

- Set DOCKER_USERNAME and DOCKER_PASSWORD where the password is the token
