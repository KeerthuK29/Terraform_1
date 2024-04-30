pipeline {
  agent any

  parameters {
    choice(name: 'action', choices: ['plan', 'apply'], description: 'Terraform action to perform')
  }
   environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

  stages {
    stage('Checkout Code') {
      steps {
      
        git branch: 'master', url:'https://github.com/KeerthuK29/Terraform-with-Jenkins.git'
        }
    
    }
    stage('Terraform run'){
      steps{
        bat 'terraform init'
      }
    }
    stage('Terraform Action') {
      when {
        expression { return params.action == 'plan' }
      }
      steps {
          
        bat "terraform plan"
    }
    }
    stage('Terraform Apply ') {
      when {
        expression { return params.action == 'apply' }
      }
      steps {
        bat "terraform apply -auto-approve"
    }
    }
  }
}
