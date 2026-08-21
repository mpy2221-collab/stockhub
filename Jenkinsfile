pipeline {
  agent any

  environment {
    EC2_HOST = '15.135.240.116'
  }

  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3.9.9-eclipse-temurin-11'
          reuseNode true
        }
      }
      steps {
        sh '''
          java -version
          mvn -B -DskipTests package
          ls -la target/stockhub.war
        '''
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([sshUserPrivateKey(
          credentialsId: 'ec2-ssh',
          keyFileVariable: 'SSH_KEY',
          usernameVariable: 'SSH_USER'
        )]) {
          sh '''
            test -f target/stockhub.war
            scp -i "$SSH_KEY" -o StrictHostKeyChecking=accept-new \
              target/stockhub.war "$SSH_USER@$EC2_HOST:/tmp/stockhub.war"
            ssh -i "$SSH_KEY" -o StrictHostKeyChecking=accept-new \
              "$SSH_USER@$EC2_HOST" "ls -lh /tmp/stockhub.war"
          '''
        }
      }
    }
    stage('Verify') {
      steps {
        echo '이번 단계는 /tmp 복사만. /opt/tomcat9/webapps 와 8090은 아직 안 바뀜'
      }
    }
  }
}
