currentBuild.displayName = "HealthCare-Application#"+currentBuild.number
pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
              git 'https://github.com/gauravbhalekar5/web-application.git'
            }
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
                  
                  scp -o StrictHostKeyChecking=no  target/web-application.war  ec2-user@34.209.28.53:/opt/tomcat8/webapps

                  ssh ec2-user@34.209.28.53 /opt/tomcat8/bin/shutdown.sh

                  ssh ec2-user@34.209.28.53 /opt/tomcat8/bin/startup.sh

                  """
                }
            }
        }
        stage('Deploy on Production') {
           steps {
                sshagent(['pipeline-user-production']) {
                    timeout(time: 5, unit: 'DAYS') {
                    input message: 'Need to be approved', ok: 'Manager Approval'
                    }
                    sh """
                  
                    scp -o StrictHostKeyChecking=no  target/web-application.war  ec2-user@54.187.142.164:/opt/tomcat8/webapps

                    ssh ec2-user@54.187.142.164 /opt/tomcat8/bin/shutdown.sh

                    ssh ec2-user@54.187.142.164 /opt/tomcat8/bin/startup.sh

                    """
                }
            }
        }      
    }   
}
