currentBuild.displayName = "HealthCare-Application#"+currentBuild.number
pipeline {
    agent any
    stages {
        stage('Poll pollSCM') {
            steps {
              triggers {
                  pollSCM ignorePostCommitHooks: true, scmpoll_spec: '* * * * *'
              }
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
