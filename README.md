# Jenkins Pipeline Documentation

## Introduction
This document explains the configuration and functionality of a Jenkins pipeline designed for a Node.js application. The pipeline automates building, testing, and deploying the application to Kubernetes.

## Environment Configuration
### Variables
- DOCKER_IMAGE: abhimanyuu18/nodejs-app:0.0.1
- KUBE_CONFIG: Kubernetes credentials configuration

### Color Mapping
- SUCCESS: good (green)
- FAILURE: danger (red)

## Pipeline Structure

### 1. Code Checkout Stage
Performs source code management checkout using SCM.

### 2. Dependency Installation Stage
Installs required NPM packages using apt package manager.

### 3. Testing Stage
Executes application tests within a Docker container environment.

### 4. Build Stage
Creates production build of the Node.js application.

### 5. Docker Image Stage
- Configures Minikube Docker environment
- Builds and tags the application Docker image

### 6. Kubernetes Deployment Stage
- Applies Kubernetes deployment configuration
- Monitors deployment rollout status

## Post-Deployment Actions
### Slack Notifications
- Channel: #better-slack-notification
- Status updates with color coding:
  - Success: Green
  - Failure: Red

## Requirements

### System Prerequisites
- Jenkins server
- Docker installation
- Kubernetes (Minikube)
- Node.js and NPM
- kubectl CLI

### Jenkins Plugins
- Docker Pipeline
- Kubernetes Continuous Deploy
- Slack Notification

## Setup Instructions

### Jenkins Configuration
1. Configure Kubernetes credentials
2. Set up Docker registry access
3. Configure Slack workspace integration

### Repository Setup
1. Add Jenkinsfile to project root
2. Ensure deployment.yaml is present
3. Update environment variables as needed
