pipeline {
    environment {
        region = 'us-west-2'
        clusterName = 'jenkins'
    }
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
        stage('Update kubeconfig') {
          steps {
            withAWS(credentials: 'Jenkins AWS', region: region) {
              sh 'aws eks --region=${region} update-kubeconfig --name ${clusterName}'
            }
          }
        }    
        stage('Deploy cluster') {
          steps {
            withAWS(credentials: 'Jenkins AWS', region: region) {
              sh 'kubectl config use-context arn:aws:eks:us-west-2:395607980508:cluster/jenkins'
              sh 'kubectl apply -f deployment.yml'
              sh 'kubectl get service'
              sh 'kubectl describe service capstone-service'
            }
          }
        }    
        stage('Check rollout status') {
          steps {
            withAWS(credentials: 'Jenkins AWS', region: region) {
              sh 'kubectl rollout status deployments/capstone-deployment'
            }
          }
        }    

    }
}