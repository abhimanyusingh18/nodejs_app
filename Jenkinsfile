def color_map = [
	'SUCCESS' : 'good',
	'FAILURE' : 'danger',
]
pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "abhimanyuu18/nodejs_app:0.0.1"
        KUBE_CONFIG = credentials('')
    }

    stages {
        stage('Checkout Code') {
            steps {
		echo "Checking for SCM..."
		checkout scm
            }
        }

        stage('Installing Dependencies') {
            steps {
		echo "Installing dependencies..."
                sh 'sudo apt install npm'
            }
        }

        stage('Run Tests') {
            steps {
		script{
			dockerImage.inside {
                		echo " Running tests..."
				sh 'npm test'
            			}
			}	
        	}
	}
	stage('Build'){
        	steps  {
			sh 'npm run build'
		}
	}

        stage('Build Docker Image') {
            steps {
		script {
          		echo "Building docker images..."
                	sh '''
				eval $(minikube docker-env)
				docker build -t ${DOCKER_IMAGE}
				'''
				}	
            		}
        	}
        stage('Deploy to Kubernetes') {
            steps {
                script {
                        sh '''
                        kubectl apply -f deploymennt.yaml
                        kubectl rollout status deployment/nodejs_app
                        '''
                    }
                }
            }
        }

    post {
        always {
            echo 'Deployment Status!'
            slackSend(channel: '#better-slack-notification', color: COLOR_MAP[currentBuild.currentResult], message: 'Deployment status for Node.js app!')
        }
    }


