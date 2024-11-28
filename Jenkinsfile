pipeline {
    agent any
    triggers {
        githubPush() // Automatically triggers on PRs
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest'
            }
        }
        stage('Package') {
            steps {
                sh 'tar -cvf app.tar app.py requirements.txt'
            }
        }
    }
    post {
        always {
            echo 'Build complete'
        }
        failure {
            echo 'Build failed'
        }
        success {
            echo 'Build successful'
        }
    }
}
