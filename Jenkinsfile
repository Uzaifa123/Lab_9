pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'  // Docker Hub registry URL
        DOCKER_USERNAME = 'your-docker-username'  // Your Docker Hub username
        IMAGE_NAME = 'python-app'  // Name of your Docker image
        DOCKER_CREDENTIALS = 'docker-credentials-id'  // Docker credentials stored in Jenkins
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Checkout the code from GitHub repository
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image and tag it with the build ID
                    dockerImage = docker.build("${DOCKER_USERNAME}/${IMAGE_NAME}:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests in the Docker container
                    dockerImage.inside {
                        sh 'pytest'  // Run pytest to execute your tests
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS) {
                        dockerImage.push()  // Push to DockerHub
                    }
                }
            }
        }
    }
}
