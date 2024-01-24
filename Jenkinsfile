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
        stage("test") {
            agent {
                 docker {
                    image 'node:latest'
                    args '-u root'
                }
            }
            steps {
                sh 'python -m coverage run manage.py test'
            }
        }
        stage("report") {
            agent {
                 docker {
                    image 'node:latest'
                    args '-u root'
                }
            }
            steps {
                sh 'python -m coverage report'
                sh 'python -m coverage xml'
                sh 'python -m coverage html'
                archiveArtifacts 'htmlcov/*'
            }
        }
        stage("assemble") {
            agent any
            steps {
                sh 'npm run build_prod'
            }
        }
    }
}