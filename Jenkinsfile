pipeline {
    agent any
	environment {
		ROOT_PASSWORD = '12345678'
	}
    stages {
        stage('Checkout Code') {
            steps {
		checkout scm
            }
        }

        stage('Installing Dependencies') {
            steps {
                sh 'sudo apt install npm'
            }
        }

        stage('Run Tests') {
            steps {
		sh 'npm test'
            	}	
       	}
	stage('Build'){
        	steps  {
		sh 'npm run build'
		}
	}
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t abhimanyuu18/nodejs_app:0.0.1'
       		}
        }
    }
}
