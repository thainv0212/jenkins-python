pipeline {
  agent { dockerfile true }
  stages {
    stage('test') {
      steps {
        sh 'python3.6 test.py'
      }  
    }
  }
}