pipeline {
  agent { dockerfile true }
  stages {
    stage('build') {
      steps {
        sh 'cd && pwd'
        sh 'whoami'
        sh 'pip install -r requirements.txt'
      }
    }
    stage('test') {
      steps {
        sh 'python test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }    
    }
  }
}