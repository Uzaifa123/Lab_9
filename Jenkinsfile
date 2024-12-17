pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                echo 'Checking out code from SCM...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Installing dependencies if requirements.txt exists
                    if (fileExists('requirements.txt')) {
                        echo 'Found requirements.txt. Installing dependencies...'
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
                    // Running tests if test.py exists
                    if (fileExists('test.py')) {
                        echo 'Found test.py. Running tests...'
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
            echo 'Build succeeded! All stages completed successfully.'
        }
        failure {
            echo 'Build failed. Please check the logs for more details.'
        }
    }
}
