pipeline {
    agent none
    environment {
        PROJECT_DIR = 'var/www/ryzhenkov_random'
    }
    stages {
        stage("deps") {
            agent {
                docker {
                    image 'node:latest'
                    args '-u root'
                }
            }
            steps {
                sh 'npm install'
            }
        }
        stage("proxy config") {
            agent any
            steps {
                withCredentials(
                    [
                        string(credentialsId: "production_ip", variable: 'SERVER_IP'),
                        sshUserPrivateKey(credentialsId: "production_key", keyFileVariable: 'SERVER_KEY', usernameVariable: 'SERVER_USERNAME')
                    ]
                ) {
                    sh 'scp -i ${SERVER_KEY} ryzhenkov.prod.mshp-devops.conf ${SERVER_USERNAME}@${SERVER_IP}:nginx'
                    sh 'ssh -i ${SERVER_KEY} ${SERVER_USERNAME}@${SERVER_IP} sudo certbot --nginx --non-interactive -d ryzhenkov.prod.mshp-devops.conf'
                    sh 'ssh -i ${SERVER_KEY} ${SERVER_USERNAME}@${SERVER_IP} sudo systemctl reload nginx'
                }
            }
        }
    }
}