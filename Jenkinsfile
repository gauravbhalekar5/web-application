pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
              git 'https://github.com/gauravbhalekar5/web-application.git'
            }
        }
        triggers {
           pollSCM '* * * * *'
        }
        stage('Build Application') {
            steps {
               sh "mvn clean package"
            }
        }
        stage('Deploy on Staging') {
            steps {
                sshagent(['pipeline-user']) {
                  sh """
                  
                  scp -o StrictHostKeyChecking=no  target/*.war  ec2-user@34.216.63.115:/opt/tomcat8/webapps

                  ssh ec2-user@34.216.63.115 /opt/tomcat8/bin/shutdown.sh

                  ssh ec2-user@34.216.63.115 /opt/tomcat8/bin/startup.sh

                  """
                }
            }
        }        
    }   
}
