pipeline {
    agent any

    tools {
        nodejs 'Node 18' // Make sure Node.js is configured in Jenkins
    }

    environment {
        REACT_APP_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Varaprasad091/ecommerce.git'
                dir('Frontend') {
                    echo 'Navigated to Frontend directory.'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('Frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                dir('Frontend') {
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                dir('Frontend') {
                    sh 'npm test -- --watchAll=false'
                }
            }
        }

        stage('Deploy') {
            steps {
                dir('Frontend') {
                    // Replace with your deployment command
                    echo 'Deploy stage - add your deployment command here'
                    // e.g., sh 'scp -r build/ user@server:/path/to/deploy/'
                }
            }
        }
    }

    post {
        success {
            echo 'Frontend pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
