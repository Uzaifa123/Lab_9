pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Check if a requirements.txt exists, then install dependencies
                    if (fileExists('requirements.txt')) {
                        echo 'Installing Python dependencies...'
                        sh 'pip install -r requirements.txt'
                    } else {
                        echo 'No requirements.txt found. Skipping dependency installation.'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Check if a test directory or script exists
                    if (fileExists('test.py')) {
                        echo 'Running Python tests...'
                        sh 'python test.py'
                    } else {
                        echo 'No test script found. Skipping tests.'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
