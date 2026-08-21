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

            ssh -i "$SSH_KEY" -o StrictHostKeyChecking=accept-new "$SSH_USER@$EC2_HOST" bash -s << 'ENDSSH'
              set -e
              TH=/opt/tomcat9
              WEB="$TH/webapps"
              KEEP=/tmp/stockhub-keep
              mkdir -p "$KEEP"
              test -f "$WEB/stockhub/WEB-INF/classes/db.properties"
              test -f "$WEB/stockhub/WEB-INF/classes/mail.properties"
              cp "$WEB/stockhub/WEB-INF/classes/db.properties" "$KEEP/"
              cp "$WEB/stockhub/WEB-INF/classes/mail.properties" "$KEEP/"

              "$TH/bin/shutdown.sh" || true
              sleep 5
              rm -rf "$WEB/stockhub" "$WEB/stockhub.war"
              cp /tmp/stockhub.war "$WEB/stockhub.war"
              "$TH/bin/startup.sh"
              sleep 8
              if [ ! -f "$WEB/stockhub/WEB-INF/classes/db.properties" ]; then
                sleep 10
              fi
              cp "$KEEP/db.properties" "$WEB/stockhub/WEB-INF/classes/"
              cp "$KEEP/mail.properties" "$WEB/stockhub/WEB-INF/classes/"
              test -f "$WEB/stockhub/WEB-INF/classes/db.properties"
              ss -lntp | grep 8090
ENDSSH
          '''
        }
      }
    }
    stage('Verify') {
      steps {
        echo 'StockHub 라이브 교체. 브라우저는 http://15.135.240.116:8090/stockhub'
        echo '영화 80 / 8888 은 이 Job이 안 건드렸어야 한다'
      }
    }
  }
}
