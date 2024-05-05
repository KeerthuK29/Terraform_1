pipeline {
  agent any

  parameters {
    choice(name:'Branch',choices:['kk-branch'],description:'Select the Branch')
    choice(name: 'action', choices: ['plan', 'apply','destroy'], description: 'Terraform action to perform')
  }
   environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    
    }

  stages {
    stage('Checkout Code') {
      
      steps {
        script{
         
      
          git branch:"${params.Branch}", url:'https://github.com/KeerthuK29/Jenkins_Terraform_Integration.git'
        }
      }
    }
    stage('Terraform Initialize'){
      steps{
          bat 'C:\\Users\\kesavank\\Terraform\\terraform init'
        
      }
    }
    stage('Terraform Plan') {
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
          bat 'C:\\Users\\kesavank\\Terraform\\terraform destroy -auto-approve'
    }
  }
}
}
