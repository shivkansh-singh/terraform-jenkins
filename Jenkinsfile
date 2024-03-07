pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    } 
    agent any

    stages {
        stage('Checkout GIT') {
            steps {
                checkout scm
            }
        }
        stage('Init') {
            steps {
                sh 'terraform init '
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out main.tfplan'
            }
        }
        stage('Confirm') {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
             }
         }
        stage('Action') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '*.tfstate', fingerprint: true
        }
    }
}
