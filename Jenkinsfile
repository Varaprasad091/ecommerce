pipeline {
    agent any  // This defines where the pipeline should run (on any available agent)

    environment {
        // Define environment variables (optional)
        APP_NAME = 'myimage'
        DOCKER_IMAGE = 'varaprasadsuddala/myimage:latest'  // Update with your Docker Hub username and project name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub (or any Git repository you use)
                git 'https://github.com/Varaprasad091/ecommerce.git'  // Your repository URL
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Node.js dependencies
                script {
                    dir('Frontend') {
                        sh 'npm install'  // Assuming you have package.json in the Frontend directory
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests if you have any
                script {
                    dir('Frontend') {
                        sh 'npm run test'  // Run tests if you have a test script in your package.json
                    }
                }
            }
        }

        stage('Build') {
            steps {
                // Build your frontend project
                script {
                    dir('Frontend') {
                        sh 'npm run build'  // This will run the build script in package.json (usually creates a dist or build folder)
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Build your Docker image (if you want to containerize the app)
                script {
                    dir('Frontend') {
                        sh 'docker build -t $DOCKER_IMAGE .'  // Build your Docker image
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    sh 'docker push $DOCKER_IMAGE'  // Push the Docker image to Docker Hub
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                // Deploy your application (adjust based on how you deploy, e.g., Kubernetes, Docker Compose, etc.)
                script {
                    sh 'kubectl apply -f deployment.yaml'  // Example deployment command for Kubernetes (replace if needed)
                }
            }
        }
    }

    post {
        success {
            // Actions to take after a successful pipeline run
            echo 'Build and deployment successful!'
        }
        failure {
            // Actions to take if the pipeline fails
            echo 'Build or deployment failed!'
        }
    }
}
