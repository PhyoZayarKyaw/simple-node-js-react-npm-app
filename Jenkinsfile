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

        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }

        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
		sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
        	sh 'chmod u+x ./kubectl'  
        	sh './kubectl get pods'
                sh 'kubectl apply -f react.yaml'
                input message: 'Finished using the web ? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}

