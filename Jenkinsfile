def build = "${env.BRANCH_NAME}".replace('-', '').replace('/', '').replace('_','')

pipeline {
    agent {
        any
    }
    stages {
        stage('Environment Version') {
          steps {
            echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            sh 'docker --version'
          }
        }
        stage('Build'){
          steps {
            sh "./build.sh"
          }
        }
        stage('Deploy'){
          steps {
            withDockerRegistry([credentialsId: 'dockerhub-htplbc']) {
              sh "./release.sh"
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
