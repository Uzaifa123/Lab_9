pipeline {
    agent any
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
                    dockerImage = docker.build("your-docker-username/python-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests in the Docker container (optional)
                    dockerImage.inside {
                        sh 'pytest'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to DockerHub (optional)
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
