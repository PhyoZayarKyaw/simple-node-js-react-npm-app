pipeline {
    agent any
    tools {
        nodejs 'NodeJS'  // This should match the name you gave the Node.js installation in Jenkins
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}