pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "myapp-image"
        DOCKER_TAG = "latest"
        DOCKER_REGISTRY = "ahmedshalaby88" 
    }

    stages {
        stage('Build JAR') {
            steps {
                echo "Compiling Java project..."
                bat 'javac MyApp.java'
            }
        }

        stage('Build Docker') {
            steps {
                echo "Building Docker image..."
                bat "docker build -t %DOCKER_IMAGE%:%DOCKER_TAG% ."
            }
        }

        stage('Docker Login') {
            steps {
                echo "Logging in to Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                }
            }
        }

        stage('Push Docker') {
            steps {
                echo "Pushing Docker image..."
                bat "docker tag %DOCKER_IMAGE%:%DOCKER_TAG% %DOCKER_REGISTRY%/%DOCKER_IMAGE%:%DOCKER_TAG%"
                bat "docker push %DOCKER_REGISTRY%/%DOCKER_IMAGE%:%DOCKER_TAG%"
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            cleanWs()
        }
    }
}
