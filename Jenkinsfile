pipeline {
  agent any

  parameters {
    choice(name:'Branch',choices:['master','kk_branch'],description:'Choosing the Branch')
    choice(name: 'action', choices: ['plan', 'apply','destroy'], description: 'Terraform action to perform')
  }
   environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

  stages {
    stage('Checkout Code') {
       when {
        expression { return params.Branch == 'master' }
      }
      steps {
      
        git branch: 'master', url:'https://github.com/KeerthuK29/Terraform-with-Jenkins.git'
        }
       when {
        expression { return params.Branch == 'kk_branch' }
      }
        steps {
      
        git branch: 'kk_branch', url:'https://github.com/KeerthuK29/Terraform-with-Jenkins.git'
        }
    
    }
    stage('Terraform run'){
      steps{
          bat 'C:\\Users\\kesavank\\Terraform\\terraform init'
        
      }
    }
    stage('Terraform Action') {
      when {
        expression { return params.action == 'plan' }
      }
      steps {
            bat 'C:\\Users\\kesavank\\Terraform\\terraform plan'
      }
    }
    stage('Terraform Apply ') {
      when {
        expression { return params.action == 'apply' }
      }
      steps {
          bat 'C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve'
    }
  }
     stage('Terraform Destroy ') {
      when {
        expression { return params.action == 'destroy' }
      }
      steps {
          bat 'C:\\Users\\kesavank\\Terraform\\terraform destroy'
    }
  }
}
}
