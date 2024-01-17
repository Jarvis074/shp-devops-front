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
    }
}