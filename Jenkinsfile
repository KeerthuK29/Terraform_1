pipeline {
  agent any

  parameters {
    choice(name:'branch',choices:['keerthu-branch','kk-branch'],description:'Select the branch to build')
    choice(name: 'action', choices: ['plan', 'apply','destroy'], description: 'Terraform action to perform')
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
          bat 'C:\\Users\\kesavank\\Terraform\\terraform init'
        
      }
    }
    stage('Terraform Action') {
      when {
        expression { return params.action == 'plan' }
      }
      steps {
            bat "C:\\Users\\kesavank\\Terraform\\terraform plan"
      }
    }
    stage('Terraform Apply ') {
      when {
        expression { return params.action == 'apply' }
      }
      steps {
          bat "C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve"
    }
  }
  stage('Terraform destroy'){
    when{
        expression {return params.action == 'destroy'}

    }
    steps{
        bat "C:\\Users\\kesavank\\Terraform\\terraform destroy -auto-approve"
    }
  }
}
}