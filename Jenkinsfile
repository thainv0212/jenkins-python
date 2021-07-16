pipeline {
  agent { 
      dockerfile true 
      args '-u root --privileged'
      }
  stages {
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt --user'
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