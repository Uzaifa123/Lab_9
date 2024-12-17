pipeline {
    agent any

    stages {
        stage('Checkout') {

             echo 'Starting Building!'
            steps {

                 echo 'Checking Jenkins File'
                // Checkout the code from the Git repository
                checkout scm
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
