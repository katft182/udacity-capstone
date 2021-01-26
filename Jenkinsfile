pipeline {
    agent any
    stages {
        stage('Install dependencies') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
    }
}