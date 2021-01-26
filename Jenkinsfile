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
        stage('Build docker image') {
            steps {
                sh 'docker build --tag=capstone .'
                sh 'docker image ls'
            }
        }
        stage('Upload docker image') {
            steps {
                withDockerRegistry([url: "", credentialsId: "dockerhub-jenkins"]) {
                    sh 'docker tag capstone katft/capstone'
                    sh 'docker push katft/capstone'
                }
            }
        }
    }
}