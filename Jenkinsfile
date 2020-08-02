currentBuild.displayName = "HealthCare-Application#"+currentBuild.number
pipeline {
    agent any
    triggers {
    pollSCM('* * * * *')
    }
    stages {
        stage('GIT Checkout Fetching') {
            steps {
             git 'https://github.com/gauravbhalekar5/web-application.git'
            }
        }
        stage('Build the Application') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Deploy on Production') {
            steps {
                sshagent(['ssh-login']) {
                    sh """
                    
                    scp -o StrictHostKeyChecking=no  target/*.war  ec2-user@54.187.11.186:/opt/tomcat8/webapps

                    ssh ec2-user@54.187.11.186 /opt/tomcat8/bin/shutdown.sh

                    ssh ec2-user@54.187.11.186 /opt/tomcat8/bin/startup.sh

                    """
                }
            }
        }
    }
}
