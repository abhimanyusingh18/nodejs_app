pipeline {
    agent any
	tools {
		maven "MAVEN3.9"
		jdk "JDK17"
		nodejs "NODEJS"
	}
    environment {
        DOCKER_IMAGE = "abhimanyuu18/nodejs-app:0.0.1"
        KUBE_CONFIG = credentials('kubeconfig-credential-id')
    }

    stages {
        stage('Checkout Code') {
            steps {
		
                git branch: 'master', url: 'https://github.com/abhimanyusingh18/nodejs_app.git'
            }
        }

        stage('Installing Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
		script{
			dockerImage.inside {
                		sh 'npm test'
            			}
			}	
        	}
	}

        stage('Build Docker Image') {
            steps {
                script {
                    docker.Image = docker.build("${env.DOCKER_IMAGE}"${env.BUILD_ID}")
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withEnv(["KUBECONFIG=${env.KUBE_CONFIG}"]) {
                        sh '''
                        kubectl set image deployment/nodejs-app nodejs-app=${DOCKER_IMAGE}
                        kubectl rollout status deployment/nodejs-app
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
            // Replace with your notification method
            slackSend(channel: '#deployments', color: 'good', message: 'Deployment successful for Node.js app!')
        }

        failure {
            echo 'Deployment Failed!'
            // Replace with your notification method
            slackSend(channel: '#deployments', color: 'danger', message: 'Deployment failed for Node.js app!')
        }
    }
}

