pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Add credentials in Jenkins
        DOCKER_IMAGE = "your-dockerhub-username/python-hello-world" // Update with your Docker Hub repo
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Pull the latest code from GitHub
                git 'https://github.com/<username>/<repo>.git'
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
                    // Run the Docker container
                    sh 'docker run --rm $DOCKER_IMAGE'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh """
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    """
                    // Tag and push the Docker image
                    sh """
                    docker tag $DOCKER_IMAGE $DOCKER_IMAGE:latest
                    docker push $DOCKER_IMAGE:latest
                    """
                }
            }
        }
    }
    post {
        always {
            // Cleanup dangling images
            sh 'docker system prune -f'
        }
    }
}
