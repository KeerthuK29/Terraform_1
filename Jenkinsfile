pipeline {
    agent any
  
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/KeerthuK29/Terraform-with-Jenkins.git'
            }
        }
        stage('Run Terraform') {
            steps {
                dir('C:\\Users\\kesavank\\Terraform with Jenkins'){
                    
                    
                 bat 'terraform init'
               
                bat 'terraform plan'
               bat 'terraform apply'
            }
            }
        }
    }
}
