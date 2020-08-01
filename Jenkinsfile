currentBuild.displayName = "HealthCare-Application#"+currentBuild.number
pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
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
                  
                  scp -o StrictHostKeyChecking=no  target/*.war  ec2-user@34.221.63.95:/opt/tomcat8/webapps

                  ssh ec2-user@34.221.63.95 /opt/tomcat8/bin/script.sh
                  
                  """
                }
            }
        }        
    }   
}
