pipeline {
    agent {
	 kubernetes {
            label 'jenkins-jenkins-agent'
            defaultContainer 'kubectl-container'
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

