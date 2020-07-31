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
                  
                  scp -o StrictHostKeyChecking=no  target/web-application.war  ec2-user@54.202.111.192:/opt/tomcat8/webapps

                  sh label: '', script: '''#! /bin/bash
                  /opt/tomcat8/bin/shutdown.sh
                  
                  sh label: '', script: '''#! /bin/bash
                  /opt/tomcat8/bin/startup.sh

                  """
                }
            }
        }        
    }   
}
