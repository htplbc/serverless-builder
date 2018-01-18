def build = "${env.BRANCH_NAME}".replace('-', '').replace('/', '').replace('_','')
def OWNER = 'htplbc'
def IMAGE = 'node-serverless'

pipeline {
    agent any

    stages {
        stage('Environment Version') {
          steps {
            echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            sh "docker --version"
          }
        }
        stage('Build'){
          steps {
            sh "docker build -t ${OWNER}/${IMAGE}:latest ."
          }
        }
        stage('Tag'){
          steps {
            sh "docker tag ${OWNER}/${IMAGE}:latest ${OWNER}/${IMAGE}:${env.BUILD_NUMBER}"
          }
        }
        stage('Deploy'){
          steps {
            withDockerRegistry([credentialsId: 'dockerhub-htplbc', url: 'https://index.docker.io/v1/']) {
              sh "docker push ${OWNER}/${IMAGE}:latest"
              sh "docker push ${OWNER}/${IMAGE}:${env.BUILD_NUMBER}"
            }
          }
        }
    }
    post {
        success {
            echo 'Do something when it is successful'
        }
        failure {
            echo 'Do something when it is failed'
        }
    }
}
