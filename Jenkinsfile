pipeline {
    agent {
        kubernetes {
             inheritFrom 'Kubernetes' // Name of your pod template
             defaultContainer 'kubernetes-container' // The container you want to run commands in
        }
    }

    tools {
        nodejs 'NodeJS'  // This should match the name you gave the Node.js installation in Jenkins
    }

    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }

        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                sh 'kubectl apply -f react.yaml'
                input message: 'Finished using the web ? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}

