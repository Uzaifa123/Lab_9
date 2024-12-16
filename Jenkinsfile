pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials') // Docker Hub credentials ID
        DOCKER_IMAGE = 'huzaifa305/python-hello-world' // Docker image name
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Uzaifa123/Lab_9.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container locally for testing
                    sh 'docker run --rm $DOCKER_IMAGE'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in and push the image to Docker Hub
                    sh """
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker tag $DOCKER_IMAGE $DOCKER_IMAGE:latest
                    docker push $DOCKER_IMAGE:latest
                    """
                }
            }
        }
    }
    post {
        always {
            // Cleanup unused Docker resources
            sh 'docker system prune -f'
        }
    }
}
