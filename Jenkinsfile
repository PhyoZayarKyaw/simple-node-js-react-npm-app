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
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
		script {
                    // Installing kubectl if not installed
                    sh '''
                        if ! command -v kubectl &> /dev/null
                        then
                            echo "kubectl not found, installing..."
                            curl -LO "https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl"
                            chmod +x kubectl
                            mkdir -p $HOME/bin
                            mv kubectl $HOME/bin/
                            echo "kubectl installed in $HOME/bin"
                            export PATH=$PATH:$HOME/bin
                        else
                            echo "kubectl is already installed"
                        fi
                    '''
                }
                sh './jenkins/scripts/deliver.sh'
		sh 'kubectl apply -f react.yaml'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
